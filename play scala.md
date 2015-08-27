# play scala demo

### 下载 工具

从play 官方 网站 下载 包 ，解压 并设置 .bashrc path 变量 

### 初始化

	activator -Dactivator.timeout=30s new "project name"

根据提示进行设置 

`代理` 有可能你需要设置 本地代理：

	我本地安装的有 shadowsocks ,基于ssh的 socks5 代理，需要 转为 http_proxy
	>安装 polipo
	sudo apt-get install polipo
    sudo service polipo status
    sudo polipo socksParentProxy=localhost:1080
    
    set HTTP_PROXY=http://localhost:8123

