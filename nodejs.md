### install

node js install guide: https://github.com/nodejs/node-v0.x-archive/wiki/Installing-Node.js-via-package-manager?utm_source=%5Bdeliciuos%5D&utm_medium=twitter#enterprise-linux-and-fedora

解压 安装 法
#export NODE_HOME=/opt/node-v0.12.7
#export PATH=${NODE_HOME}/bin:$PATH
#export NODE_PATH=${NODE_HOME}/lib/node_modules

### npm install

  npm install package -g
  npm install package --verbose

### syntax

- about module export

  module.exports = (function () {));
  or
  var logger = exports;
  logger.a=function(){};

  then
  var moduleDefinedName= require('./module.js');

### forever  
- install

  npm install forever -g

1. 简单的启动
forever start app.js

2. 指定forever信息输出文件，当然，默认它会放到~/.forever/forever.log
forever start -l forever.log app.js

3. 指定app.js中的日志信息和错误日志输出文件，
//  -o 就是console.log输出的信息，-e 就是console.error输出的信息
forever start -o out.log -e err.log app.js

4. 追加日志，forever默认是不能覆盖上次的启动日志，
//  所以如果第二次启动不加-a，则会不让运行
forever start -l forever.log -a app.js

 5. 监听当前文件夹下的所有文件改动
forever start -w app.js

文件改动监听并自动重启

// 1. 监听当前文件夹下的所有文件改动（不太建议这样）
forever start -w app.js

显示所有运行的服务

forever list

停止操作

// 1. 停止所有运行的node App
forever stopall

// 2. 停止其中一个node App
forever stop app.js
// 当然还可以这样
// forever list 找到对应的id，然后：
forever stop [id]

重启操作

重启操作跟停止操作保持一致。

// 1. 启动所有
forever restartall

开发和线上建议配置

// 开发环境下
NODE_ENV=development forever start -l forever.log -e err.log -a app.js
// 线上环境下
NODE_ENV=production forever start -l ~/.forever/forever.log -e ~/.forever/err.log -w -a app.js

上面加上NODE_ENV为了让app.js辨认当前是什么环境用的。不加它可能就不知道哦？
一些注意点

### monitor node app and restart solution

  [stackoverflow](http://stackoverflow.com/questions/23713508/restart-node-js-forever-process-if-response-time-too-big)
  [monit](http://howtonode.org/deploying-node-upstart-monit)

### rest load test

  https://github.com/jeffbski/bench-rest#rest-flow
  https://github.com/shoreditch-ops/minigun
  https://github.com/jpillora/node-load-tester
  https://github.com/mithunsatheesh/node-stress
