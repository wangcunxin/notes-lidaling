
## 设置　my.pth

在terminal中输入 python,或在IDE中编写代码

	>import sys
	>print(sys.path)

以上将会得到当前编译器使用的python环境路径,然后执行

	cd ／home/lidl/soft/python_venv/spark/lib/python2.7/site-packages
    touch my.pth
    vim my.pth
    
输入spark　python　lib的路径

	/home/lidl/cloud/spark/python
    /home/lidl/cloud/spark/python/lib/py4j-0.8.2.1-src.zip

现在　你可以在python　ide中编写spark的代码了
    
问题：
１　如果出现编译问题（传说中的红线），可以在pycharm中执行：

	File->Invalidate cache/restart