列出所有镜像(images)
docker images
列出正在运行的(容器)containers
docker ps
列出所有的容器
docker ps -a
下载centos镜像
docker pull centos
运行centos镜像
docker run -i -t centos /bin/bash

docker run -d -p 80:80   hjue/centos-lamp
运行容器并做http端口转发
docker run -i -t -p :80 LAMP /bin/bash
建立映像文件
docker build --rm=true -t hjue/lamp .
–rm 选项是告诉Docker在构建完成后删除临时的Container，Dockerfile的每一行指令都会创建一个临时的Container，一般你是不需要这些临时生成的Container
提交你的变更，并且把容器保存成镜像，命名为 mynewimage.3a09b2588478为容器的ID.
docker commit 3a09b2588478 mynewimage   
把 mynewimage 镜像保存成 tar 文件
docker save mynewimage | bzip2 -9 -c> /home/save.tar.bz2
加载 mynewimage 镜像
bzip2 -d -c < /home/save.tar.bz2 | docker load  
删除所有容器
docker rm `docker ps -a -q`
删除镜像
docker rmi [image-id]
帮助
docker run --help   
导出Image
docker export <CONTAINER ID> > /home/export.tar
导入Image镜像
cat /home/export.tar | sudo docker import - mynewimage

---
docker inspect <container_name>

docker images --tree


---
删除容器

	sudo docker rm $(sudo docker ps -a -q)

删除没有tag的images

	sudo docker rmi $(sudo docker images | grep '^<none>' | awk '{print $3}')

运行container

	sudo docker start $containerId

重新连接到container

	sudo docker attach $containerId
查看container详细ID

	docker inspect -f '{{ .State.Pid }}' $CONTAINER_ID


### fig -> compose

	pip install docker-compose

### network

	Docker自身的网络功能比较简单，不能满足很多复杂的应用场景。因此，有很多开源项目用来改善Docker的网络功能，如pipework、weave、flannel等。这里，就先介绍一下pipework的使用和工作原理

```
	host模式，使用--net=host指定。
	container模式，使用--net=container:NAME_or_ID指定。
	none模式，使用--net=none指定。
	bridge模式，使用--net=bridge指定，默认设置
```
	sudo docker run -d -p 80:80 steeef/graphite-centos

	docker 80端口映射到本地

### run /bin/bash on a running container

	sudo docker exec -ti graphite /bin/bash

### run in error

	sometime you need to check /var/log/docker file

### run

	docker run -d --name=graphite -p 80:80 -p 2003:2003 -p 2004:2004 -p 7002:7002 steeef/graphite-centos
	docker run -d --name=grafana -p 3000:3000 grafana/grafana

### move container

	[ref](http://stackoverflow.com/questions/28734086/how-to-move-docker-containers-between-different-hosts)
	docker export <CONTAINER ID> > /home/export.tar
	cat /home/export.tar | docker import - some-name:latest
