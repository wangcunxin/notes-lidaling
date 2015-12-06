error:

  install got an error, rolling back install

出现以上错误可以执行以下命令。

  npm install -g node-gyp

  其依赖有：gcc \make\python (2.7 is recommend)


### react with onode

  example :

    http://blog.yld.io/2015/06/10/getting-started-with-react-and-node-js/

### about express  koa  hapi web framework

    http://segmentfault.com/a/1190000002421718

### other

jscore

  one lib can run on mobile devices
### response the server execute topicname

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
