#install collectd on Ubuntu

## install

	sudo apt-get install collectd collectd-utils

## config

	sudo vim /etc/collectd/collectd.conf

- 打开hostname配置

	Hostname "graph_host" #这个配置决定　在graphite里　主机显示为什么　名字　

- 打开Interval，并设置间隔时间

	Interval=10 #设置　为10秒钟

- 打开write_graphite　插件　

/write_graphite #　vim模式下搜索

	LoadPlugin write_graphite

- 配置graphite　plugin

```
<Plugin write_graphite>
    <Node "graphing">
        Host "localhost"
        Port "2003"
        Protocol "tcp"
        LogSendErrors true
        Prefix "collectd."
        StoreRates true
        AlwaysAppendDS false
        EscapeCharacter "_"
    </Node>
</Plugin>
```

## graphite 配置

	sudo vim /etc/carbon/storage-schemas.conf

添加内容　在`最上方`

```
[collectd]
pattern = ^collectd.*
retentions = 10s:1d,1m:7d,10m:1y
```

## 操作

- 重启collectd

	sudo service collectd restart

- 重启graphite

	sudo service carbon-cache stop  #hold seconds
	sudo service carbon-cache start
