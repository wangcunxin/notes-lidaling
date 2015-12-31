error:

  install got an error, rolling back install

出现以上错误可以执行以下命令。

  npm install -g node-gyp

  其依赖有：gcc \make\python (2.7 is recommend)

# react with onode
  example :

```
http://blog.yld.io/2015/06/10/getting-started-with-react-and-node-js/
```

# about express  koa  hapi web framework

```
http://segmentfault.com/a/1190000002421718
```

# other
jscore

  one lib can run on mobile devices

# response the server execute topicname

```
app.use(function (req, res, next) {
    // 记录start time:
    var exec_start_at = Date.now();
    // 保存原始处理函数:
    var _send = res.send;
    // 绑定我们自己的处理函数:
    res.send = function () {
        // 发送Header:
        res.set('X-Execution-Time', String(Date.now() - exec_start_at));
        // 调用原始处理函数:
        return _send.apply(res, arguments);
    };
    next();
});
```

# hot load
  [http://dailyjs.com/2010/02/05/hot-code-loading/](http://dailyjs.com/2010/02/05/hot-code-loading/)

```
  var requestHandler = require('./myRequestHandler.js');
var fs = require('fs');
var http =require('http')

fs.watchFile('./myRequestHandler.js', function () {
    console.log('file changed..');
    delete require.cache[require.resolve('./myRequestHandler.js')]
    requestHandler = require('./myRequestHandler.js');
})

var reqHandlerClosure = function (req, res) {
    requestHandler.handle(req, res);
}

http.createServer(reqHandlerClosure).listen(8000);
```

- d3 links

  https://github.com/wbkd/awesome-d3
  http://oli.me.uk/2015/09/09/d3-within-react-the-right-way/
  http://10consulting.com/2014/02/19/d3-plus-reactjs-for-charting/
