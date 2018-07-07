# AWS Notes

## S3

### Get Bucket ACL Info

    $ aws s3api get-bucket-acl --bucket <bucket_name>


### Get Bucket Object ACL Info

    aws s3api get-object-acl --bucket <bucket_name> --key '<object_name>'
