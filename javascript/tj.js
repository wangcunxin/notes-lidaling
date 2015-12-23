(function(g, fn, fn2) {
    if (!g.IDTOOLS) {
        g.IDTOOLS = fn();
    }
    if (!g.BBLINK_WEB_TJ) {
        g.BBLINK_WEB_TJ = fn2(g.IDTOOLS);
    }
})(window, function() {
        var sites = [{ domain: 'hoswifi.bblink.cn', path: '/',siteID:'1' },
        { domain: 'hoswifi.bblink.cn', path: '/v2',siteID:'1' },
        { domain: 'hoswifi.bblink.cn', path: '/v3',siteID:'1' },
        { domain: 'yabibuy.com', path: '/',siteID:'2' },
        { domain: 'localhost', path: '/',siteID:'-1' }];

        function generateUUID() {
            var d = new Date().getTime();
            var uuid = 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                var r = (d + Math.random() * 16) % 16 | 0;
                d = Math.floor(d / 16);
                return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
            });
            return uuid;
        };
        var makeids=[generateUUID(),generateUUID(),generateUUID(),generateUUID(),generateUUID()];
        console.log(makeids);
        var UUID = 'bbkuid6';
        var UUIDCTIME = 'bbkuidctime6';

        function setCookie(name, value, domain, path, expires) {
            if (expires == -1) {
                expires = new Date(+new Date() + 1000 * 60 * 60 * 24 * 365);
            }
            var ss = [name + '=' + encodeURIComponent(value)];
            expires && ss.push('expires=' + expires.toGMTString());
            domain && ss.push('domain=' + domain);
            path && ss.push('path=' + path);
            document.cookie = ss.join(';');
        }

        function getCookies() {
            var dic = {};
            var ss = document.cookie.split(';');
            for (var i = 0, len = ss.length; i < len; i++) {
                var ss2 = ss[i].split('=');
                dic[ss2[0]] = decodeURIComponent(ss2[1]);
            }
            return dic;
        }

        function deleteCookie(name, domain, path) {
            setCookie(name, '', domain, path, new Date(0));
        }

        function getCookie(cookieName) {
            var re = new RegExp('\\b' + cookieName + '=([^;]*)\\b');
            var arr = re.exec(document.cookie);
            return arr ? decodeURIComponent(arr[1]) : '';
        }

        function findSite(domain) {
            for (var i = 0, len = sites.length; i < len; i++) {
                var item = sites[i];
                if (item.domain.toLowerCase() == domain.toLowerCase()) {
                    return item;
                }
            }
            return {
                domain: null,path: '/',siteID:null
            };
        }

        function makeGUID(index) {
            return makeids[index];
        }
        var site = findSite(document.domain);
        var siteID=site.siteID;
        var uuid = getCookie(UUID);
        var uuidCTime = getCookie(UUIDCTIME);
        if (!uuid) {
            uuid = makeGUID(0);
            uuidCTime = '<%= time %>';
            setCookie(UUID, uuid, site.domain, site.path, -1);
            setCookie(UUIDCTIME, uuidCTime, site.domain, site.path, -1);
        }

        for (var i = 1; i <= 5; i++) {
            deleteCookie('bbkuid' + i, site.domain, site.path);
            deleteCookie('bbkuidctime' + i, site.domain, site.path);
        }

        var _mac=getCookie('mac');
        var _hosid=getCookie('hosid');
        var _gwid=getCookie('gwid');

        return {
            siteID:siteID,
            guid: '<%= guid %>',
            guidCTime: <%= createTime %>,
            from: '<%= from %>',
            time: '<%= time %>',
            uuid: uuid,
            uuidCTime: uuidCTime,
            makeGUID: makeGUID,
            getCookie: getCookie,
            getCookies: getCookies,
            setCookie: setCookie,
            deleteCookie: deleteCookie,
            mac:_mac,
            gwid:_gwid,
            hosid:_hosid,
            dac: function(key, version, args) {
                var ss = ['siteID='+siteID,'guuid=' + IDTOOLS.guid, 'guuidCTime=' + IDTOOLS.guidCTime, 'uuid=' + IDTOOLS.uuid, 'uuidCTime=' + IDTOOLS.uuidCTime, 'ip=$ip', 'ua=$ua', 'createTime=$servertime'];
                if (args) {
                    for (var p in args) {
                        ss.push(p + '=' + encodeURIComponent(args[p]));
                    }
                }
                new Image().src = 'http://dac.bblink.cn/sitetj/' + key + '/' + version + '/?' + ss.join('&');
            },
            popen: function (url) {
                window.parent.location.href = url;
            },
        };
    },
    function(tools) {
        var pageID = tools.makeGUID(4);
        var begin = +new Date();
        var DAC_URL = 'http://dac.bblink.cn/';
        var TIME_CK_PREFIX = 'tjptime_';

        function sendPV(prevPID, prevTime) {
            var ss = [
              'siteID='+tools.siteID,'pid=' + pageID, 'guuid=' + tools.guid, 'guuidCTime=' + tools.guidCTime,
              'uuid=' + tools.uuid, 'uuidCTime=' + tools.uuidCTime, 'ip=$ip', 'ua=$ua', 'createTime=$servertime',
              'pageTitle=' + encodeURIComponent(document.title), 'url=' + encodeURIComponent(location.href),
              'referer=' + encodeURIComponent(document.referrer), 'language=' + navigator.language,
              'cookieEnabled=' + navigator.cookieEnabled, 'sw=' + screen.width, 'sh=' + screen.height,
              'prevPID=' + prevPID, 'prevTime=' + prevTime,'mac='+tools.mac,'hosId='+tools.hosid,'gwid='+tools.gwid
            ];
            new Image().src = DAC_URL + 'sitetj/sitePV/v4/?' + ss.join('&');
        }

        function sendTime(pid, time) {
            var ss = ['siteID='+siteID,'pid=' + pid, 'time=' + time];
            new Image().src = DAC_URL + 'sitetj/siteTime/v4/?' + ss.join('&');
        }

        var cookies = tools.getCookies();
        var prevPID = '';
        var prevTime = 0;
        for (var p in cookies) {
            if (p.indexOf(TIME_CK_PREFIX) != -1) {
                //console.log(cookies[p]);
                //sendTime(p.split('_')[1], cookies[p]);
                prevPID = p.split('_')[1];
                prevTime = cookies[p];
                tools.deleteCookie(p);
            }
        }

        sendPV(prevPID, prevTime);

        //console.log(document.cookie, pageID);

        function unload() {
            tools.setCookie(TIME_CK_PREFIX + pageID, +new Date() - begin);
        }
        if ('addEventListener' in window) {
            window.addEventListener('unload', unload);
        } else {
            window.attachEvent('onunload', unload);
        }

        return {};
    });
