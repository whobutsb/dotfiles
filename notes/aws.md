# AWS Notes

## S3

### Get Bucket ACL Info

    $ aws s3api get-bucket-acl --bucket <bucket_name>


### Get Bucket Object ACL Info

    aws s3api get-object-acl --bucket <bucket_name> --key '<object_name>'

## VPC 

### How to setup AWS lambda function to talk to the internet and VPC

[Copied from reggi/how-to-setup-lambda-to-talk-to-internet-and-vpc.md](https://gist.github.com/reggi/dc5f2620b7b4f515e68e46255ac042a7)

I'm going to walk you through the steps for setting up a AWS Lambda to talk to the internet and a VPC. Let's dive in.

So it might be really unintuitive at first but lambda functions have three states.

1. No VPC, where it can talk openly to the web, but can't talk to any of your AWS services.
2. VPC, the default setting where the lambda function can talk to your AWS services but can't talk to the web.
3. VPC with NAT, The best of both worlds, AWS services and web.

I'm gonna walk you through the steps to set up number `3`.

> Note: This tutorial isn't exactly in order of steps, you may need to create one thing (subnet, nat, route table) then go back into the settings for something previously created and edit it to use a newly thing.

#### Creating Subnets

> VPC Dashboard > Subnets

This is what I had to start with, my existing `vpc` that I wanted to connect to already had 4 `subnets`. Here I noticed I had a couple of subnets already set up. Below is a totally fake ip I pulled from the internet. But the patten of increments of 16 is recreated here.

> Note: DO NOT use `131.179.0.0/16` it's just an example.

VPC|CIDR
--- | ---
vpc-████████ (131.179.0.0/16)|131.179.0.0/20
vpc-████████ (131.179.0.0/16)|131.179.16.0/20
vpc-████████ (131.179.0.0/16)|131.179.32.0/20
vpc-████████ (131.179.0.0/16)|131.179.48.0/20

Here I created three four new `subnets`.

VPC|CIDR|name
--- | --- | ---
vpc-████████ (131.179.0.0/16)|131.179.64.0/20|lambda-subnet-point-to-nat-1
vpc-████████ (131.179.0.0/16)|131.179.80.0/20|lambda-subnet-point-to-nat-2
vpc-████████ (131.179.0.0/16)|131.179.96.0/20|lambda-subnet-point-to-nat-3
vpc-████████ (131.179.0.0/16)|131.179.112.0/20|lambda-subnet-point-to-igw

> Note: Here `igw` stands for `Internet Gateway` and `nat` stands for `network address translation gateway (NAT Gateway)`.

Three of them will point to the `nat` and one points to the `igw`.

Let's create the `Route Tables` now.

#### Creating Route Tables

> VPC Dashboard > Route Tables

Your going to want to set up two `Route Tables`.

One that points to your `nat` let's call this `lambda-rt-to-nat`:

Destination|Target
---|---
131.179.0.0/16 | local 
0.0.0.0/0 | nat-█████████████████

One that points to your `igw` let's call this `lambda-rt-to-igw`:

Destination|Target
---|---
131.179.0.0/16 | local 
0.0.0.0/0 | igw-████████


Your gonna want to go into each of the subnet and assign them to their corresponding `route table`.

subnet name | route table name
---|---
lambda-subnet-point-to-nat-1 | lambda-rt-to-nat
lambda-subnet-point-to-nat-2 | lambda-rt-to-nat
lambda-subnet-point-to-nat-3 | lambda-rt-to-nat
lambda-subnet-point-to-igw | lambda-rt-to-igw

#### Set your lambda up

> Lambda > Functions > my-function > Configuration > Advanced Settings

Now you want to set up your lambda function to use the subnets you created.

Setup your lambda to use your VPC.

> VPC

vpc-████████ (131.179.0.0/16)

Here you setup lambda to use the subnets that point directly to your `nat`.

> Subnets*

subnet name |
--- |
lambda-subnet-point-to-nat-1 |
lambda-subnet-point-to-nat-2 |
lambda-subnet-point-to-nat-3 |

#### Create a NAT

> VPC Dashboard > NAT Gateways > Create NAT Gateway

Your going to want click `Create NAT Gateway` and set the `Subnet*` to `lambda-subnet-point-to-igw`, and `Create New EIP`.

#### Fin

That should be it! Your lambda should be able to talk to both the VPS and the web through a NAT! Comment below if you need help or want to clarify anything here!

#### Links

* [Essentials: Introducing VPC Support for AWS Lambda](http://www.slideshare.net/AmazonWebServices/february-2016-webinar-series-accessing-resources-in-vpc-with-aws-lambda)
* [AWS Lambda: How to setup a NAT gateway for a lambda function with VPC access](http://stackoverflow.com/questions/35455281/aws-lambda-how-to-setup-a-nat-gateway-for-a-lambda-function-with-vpc-access)
* [New – Access Resources in a VPC from Your Lambda Functions](https://aws.amazon.com/blogs/aws/new-access-resources-in-a-vpc-from-your-lambda-functions/)
* [Configuring a Lambda Function to Access Resources in an Amazon VPC](http://docs.aws.amazon.com/lambda/latest/dg/vpc.html)
* [February 2016 Webinar Series - Introducing VPC Support for AWS Lambda](https://www.youtube.com/watch?v=Qn8uGcfBb_I)
