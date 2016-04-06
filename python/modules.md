
### new modules

  [让人耳目一新的python库](http://pyzh.readthedocs.org/en/latest/awesome-python-libraries.html#purl)

### pip install

- before using pip to mange package , install python-dev
- if network is not connected ,use mainland python site is better

  pip install module -i http://pypi.douban.com/sample

  ```
  	清化大学：http://e.pypi.python.org/simple
  	教育网：http://pypi.tuna.tsinghua.edu.cn/simple
	aliyun: http://mirrors.aliyun.com/pypi/simple
  ```

- set pip mirrors

	vim ~/.pip/pip.conf

add 

	[global]
	index-url = http://mirrors.aliyun.com/pypi/simple


### python email 

- body and attachement
	
	http://stackoverflow.com/questions/23397654/python-smtplib-sendmail-mime-multipart-body-doesnt-shown-on-iphone
