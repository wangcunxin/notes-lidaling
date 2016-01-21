- without jquery

  http://blog.garstasio.com/you-dont-need-jquery/ajax/#jsonp
  http://oscargodson.com/posts/unmasking-jsonp.html

- good web for begginer

  https://scotch.io/

- base64 function

```
var Encoder={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Encoder._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9\+\/\=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Encoder._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/\r\n/g,"\n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}}
```

usage:

  Encoder.encode('5')
  Encoder.decode('NQ==')


- js事件侦听


DOM有个事件流的特性，也就是说我们在页面上触发节点的时候事件都会上下或者向上传播，事件捕捉和事件冒泡.DOM2.0模型将事件处理流程分为三个阶段：一、事件捕获阶段，二、事件目标阶段，三、事件起泡阶段

在事件捕获阶段，事件将沿着DOM树向下传送，直至目标element。在事件冒泡阶段，事件将从目标开始向DOM root传送 。基于此特性，就可以实现事件委托，也就是把事件监听放在外层 或root，在事件 发生时 对事件 关联属性进行判断，如果符合条件 ，就执行function.

Jquery就是基于此特性的事件委托机制实现on等事件api。可以解决 ：

- 第一：大量的事件绑定，性能消耗，而且还需要解绑（IE会泄漏）
- 第二：绑定的元素必须要存在
- 第三: 后期生成HTML会没有事件绑定，需要重新绑定
- 第四: 语法过于繁杂


[ref](http://www.cnblogs.com/aaronjs/p/3440647.html


```
element.addEventListener('click',function(){},userCapture);
// userCapture=true 时 遵守事件捕获机制，为false时遵守事件冒泡机制
```

[jsfiddle](http://jsfiddle.net/KEjke/1/)


后生成元素的事件绑定，执行
  ```
  var d = document.getElementById("d");
  var p = document.getElementById("p");

  d.addEventListener ("DOMNodeInserted", function(ev) {
    if (ev.relatedNode == d) {
        alert("element inserted into div");
    }
    else if (ev.relatedNode == p) {
        alert("element inserted into p");
    }
  });

  var span = document.createElement("span");
  d.appendChild(span);
  p.appendChild(span);
  ```


后生成元素的 加载，点击事件 监听
  ```
   var targetObj=document.getElementById("adplace1");
        targetObj.addEventListener("DOMNodeInserted",function(){
            if ( event.target.className === 'ad') {
                tools.dac("ad", 'v1', [
                    'load=1'
                ]);
            }
        });


        targetObj.addEventListener("click", function(event){
            if ( event.target.className === 'ad') {
                tools.dac("ad", 'v1', [
                    'click=1'
                ]);
            }
        });
  var iid=setInterval(function(){
                var _image= document.createElement('img');
                _image.setAttribute("id","ade");
                _image.setAttribute("class","ad");
                _image.setAttribute("src","http://images.csdn.net/20160121/Screen-Shot-2013-11-06-at-12.05.36-PM.png");
                targetObj.appendChild(_image);
                window.clearInterval(iid);
        },3000);
  ```

### help web site

- http://help.dottoro.com/ljmcxjla.php
- https://developer.mozilla.org/en-US/docs/Web/API/Event


