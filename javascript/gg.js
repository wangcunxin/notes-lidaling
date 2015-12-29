(function() {
  function load() {
    var url = 'http://adapi.bblink.cn/adinfo/?adP=';
    var dic = {};
    var ids = [];

    var ss = '<%=req.query.ids%>'.split(',');
    for (var i = 0, len = ss.length; i < len; i++) {
      var item = ss[i].split(':');
      dic[item[0]] = item[1];
      ids.push(item[0]);
    }

    if (!ids.length) {
      return;
    }

    var ios = navigator.userAgent.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
    var uid = IDTOOLS.makeGUID(2);

    var callbackid = 'bblink_ad_callback_' + (+new Date());
    window[callbackid] = function(d) {
      document.body.removeChild(e);
      delete window[callbackid];
      if (d.errorCode) {
        return;
      }
      for (var i = 0, len = d.data.length; i < len; i++) {
        var item = d.data[i];
        if (item.adP in dic) {
          var dom = document.getElementById(dic[item.adP]);
          if (dom) {
            var html = item.html;
            dom.innerHTML = html.replace(/{_key}/g, 'adClick').replace(/{_version}/g, 'v1').replace(/{_uid}/g, uid);
            dom.style.display = '';

            IDTOOLS.dac('adPlay', 'v1', {
              uid: uid,
              adid: item.adId
            });
          }

          new Image().src = 'http://adapi.bblink.cn/count/' + item.adId;

          if (item.monitorPath) {
            var image = new Image();
            image.onload = function() {
              IDTOOLS.dac('adMaster', 'v2', {
                hosId: window._hosid,
                gwid: window._gwid,
                adId: item.adId,
                apId: item.adP,
                url: location.href
              });
            };
            image.src = item.monitorPath;
          }

          IDTOOLS.dac('adLoad', 'v1', {
            uid: uid,
            adid: item.adId,
            url: location.href,
            referer: document.referer ? document.referer : '',
            hosid: window._hosid ? window._hosid : '',
            gw_id: window._gwid ? window._gwid : ''
          });
        }
      }
    };

    var e = document.createElement('script');
    e.src = url + ids.join(':') + '&lId=' + (window._hosid ? window._hosid : '0') + '&os=' + (ios ? 'ios' : 'android') + '&callback=window.' + callbackid;
    document.body.appendChild(e);
  }

  if (window.IDTOOLS) {
    load();
  } else {
    var e = document.createElement('script');
    e.src = 'http://dac.bblink.cn/g.js?curl=' + encodeURIComponent(location.href);
    document.body.appendChild(e);

    var sid = setInterval(function() {
      if (window.IDTOOLS) {
        clearInterval(sid);
        load();
      }
    }, 100);
  }
})();
