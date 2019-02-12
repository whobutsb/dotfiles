## Docker

## Commands

#### Show all running containers

    docker ps

#### Stop all containers

    docker stop $(docker ps -a -q)

#### Remove all containers

    docker rm $($docker ps -a -q)

#### Delete all images

    docker rmi $(docker images -q)

#### Delete all unused images

    docker images -q |xargs docker rmi

#### Run a command

    docker exec [image_id|image_name] [command]

or with docker-compose file:

    docker-compose exec [service_name] [command]


## Articles

- [Beautiful Laravel Development with Docker & Fig](http://www.dylanlindgren.com/laravel-development-docker-fig/)

## Tools

- [Fig.sh](http://www.dylanlindgren.com/laravel-development-docker-fig/)

## OSX and Docker

- [Docker/OSX](https://github.com/noplay/docker-osx)
- [Docker in Dev and in Production - A Complete and  DIY Guide](http://davidmburke.com/2014/09/26/docker-in-dev-and-in-production-a-complete-and-diy-guide/)
- [Docker - Beginner's Tutorial](https://blog.talpor.com/2015/01/docker-beginners-tutorial/)


## Docker Hosts

### Create a Docker Host Instance on EC2

    docker-machine create --driver amazonec2 \
      --amazonec2-instance-type t2.small \
      # --amazonec2-open-port 8888 \
      --amazonec2-root-size 20 \
      --amazonec2-region us-west-2 \
      --amazonec2-security-group "Security Group Name" \
      --amazonec2-keypair-name [key-name]-CC \
      --amazonec2-ssh-keypath [~/local/path/to/sshkey] \
      host-machine-name

https://docs.docker.com/machine/drivers/aws/


### Connect to Docker Host

    eval $(docker-machine env [docker-host-name])

https://www.kevinkuszyk.com/2016/11/28/connect-your-docker-client-to-a-remote-docker-host/

### Disconnect from Docker Host

    eval $(docker-machine env -u)

### Get Docker Information

    docker-machine inspect [docker-host-name]

## Portainer

Endpoint URL: [IP Address]:2376
Public IP: [IP Address]

Setting the TLS certificates when adding a new endpoint.

- TLS CA Certificate: `~/.docker/machine/[hostname]/ca.pem`
- TLS Certificate: `~/.docker/machine/[hostname]/cert.pem`
- TLS Key: `~/.docker/machine/[hostname]/key.pem`

## Deployments and rolling updates with docker-compose

https://blog.capstonec.com/2018/06/28/zero-downtime-deployment-with-docker-rolling-updates/
