## pull docker image from aliyun

specify args in /etc/sysconfig/docker

```
# /etc/sysconfig/docker
#
# Other arguments to pass to the docker daemon process
# These will be parsed by the sysv initscript and appended
# to the arguments list passed to docker -d

other_args="--insecure-registry=registry.mirrors.aliyuncs.com"
```