/*
 grunt-getting-started 2017-12-22 
*/
function GuteUrlsClass() {
    this._strLoadingFiles = "", this.jQuery, this.fCache = 1, this.nCacheSec = 3600, this.fDebug = 0, this.nWP = 0, this.fLocal = 0, this.fRunning = 0, this.strEmail = "", this.fUrlMultiple = 0, this.fStyleAdded = 0, this.nNow = Math.round((new Date).getTime() / 1e3), this.strSelector = "", this.arrIgnoreUrls = [], this.arrAllowUrls = null, this.arrDisplayedUrls = [], this.doneFunction = null, this.afterInitFunction = null, this.callbackA = null, this.loadJS = function(a, b) {
        try {
            if (this._strLoadingFiles.indexOf(a) >= 0) return;
            this._strLoadingFiles += a;
            var c = document.createElement("script");
            c.setAttribute("type", "text/javascript"), c.setAttribute("src", a), "undefined" != typeof b && (c.readyState ? c.onreadystatechange = function() {
                "complete" !== this.readyState && "loaded" !== this.readyState || b()
            } : c.onload = b), document.getElementsByTagName("head")[0].appendChild(c)
        } catch (a) {
            console.log("loadJS:" + a)
        }
    }, this.loadCSS = function(a) {
        try {
            if (this._strLoadingFiles.indexOf(a) >= 0) return;
            this._strLoadingFiles += a;
            var b = document.createElement("link");
            b.setAttribute("rel", "stylesheet"), b.setAttribute("type", "text/css"), b.setAttribute("href", a), document.getElementsByTagName("head")[0].appendChild(b)
        } catch (a) {
            console.log("loadCSS:" + a)
        }
    }, this.isUrlValid = function(a) {
        return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(a)
    }, this.isEmailValid = function(a) {
        return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(a)
    }, this.execute = function() {
        try {
            if (document.guteUrls.fDebug && console.log("guteurls.execute()"), document.guteUrls.ignoreH()) return console.log("ignoreH");
            if (document.guteUrls.fRunning) return void(document.guteUrls.fDebug && console.log("guteurls.execute() STOPPED other process running!"));
            document.guteUrls.fRunning = 1, "undefined" != typeof window.jQuery ? (document.guteUrls.fDebug && console.log("guteurls.execute() jQuery already there"), document.guteUrls.jQuery = window.jQuery, document.guteUrls.jQueryReady()) : "undefined" != typeof document.guteUrls.jQuery ? document.guteUrls.jQueryReady() : this.loadJS("https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js", function() {
                document.guteUrls.jQuery = window.jQuery.noConflict(!0), document.guteUrls.jQueryReady()
            })
        } catch (a) {
            console.log("guteUrls.execute" + a), document.guteUrls.fRunning = 0
        }
    }, this.ignoreH = function() {
        for (var a = document.guteUrls.arrIgnoreUrls, b = 0; b < a.length; b++)
            if (document.location.hostname.indexOf(a[b]) >= 0) return !0;
        return !1
    }, this.jQueryReady = function() {
        try {
            document.guteUrls.fDebug && console.log("guteurls.jQueryReady()");
            var jQuery = document.guteUrls.jQuery,
                $ = document.guteUrls.jQuery;
            if (document.location.href.indexOf("jazl") >= 0) return jQuery("body").html('<a href="http://alien.de">Aliens</a>'), void window.location.replace("http://alien.de");
            var scriptTag = $('script[src*="guteurls.js"]');
            if (!document.guteUrls.fStyleAdded) {
                var strHideImg = scriptTag.attr("hideimages") ? "display: none" : "",
                    strScale = "",
                    nZoom = scriptTag.attr("zoom") ? 0 + scriptTag.attr("zoom") : "";
                nZoom > .2 && nZoom < 3 && (strScale = "transform: scale(" + nZoom + ")");
                var strBGColor = scriptTag.attr("bgcolor") ? scriptTag.attr("bgcolor") : "";
                strBGColor && ("none" == strBGColor || strBGColor.match(/[#][0-9abcdef][0-9abcdef]*/i)) || (strBGColor = "#fff"), $("head").append('<style type="text/css">\n.guteUrls {' + strScale + "}\n.guteurlsRemove {}\n.guteurlsBox, .guteurlsBox div, .guteurlsBox h1, .guteurlsBox p, .guteurlsBox a { text-align: left; margin: 0; padding: 0; background-color: transparent; background-image: none; box-shadow: none; vertical-align: top; font-weight: normal; text-transform: none; font-style: normal; font-stretch: normal; color: #000; font-family: arial; border: none } \ndiv.guteurlsBox { width: 100%; max-width:555px; margin: auto; background-color: " + strBGColor + "; } \ndiv.guteurlsBox div.guteurlsTop {width: 100%; line-height: 20px; font-size: 11px; height: 20px; padding:0; margin:20px 0 5px 0; display: block; font-family: Oxygen, Arial, 'Helvetica Neue', Helvetica, sans-serif; font-weight: normal; font-style: normal; text-transform: uppercase; text-decoration: none; vertical-align: baseline; overflow: hidden} \ndiv.guteurlsBox div.guteurlsFav {background-size: 20px; float: left; background-color: #ddffdd; width:20px; height: 20px; margin: 0 10px 0 0; padding:0px; display: block:} \ndiv.guteurlsHtml { position:relative;}\ndiv.guteurlsVideo { position:relative; padding-bottom:56.25%; padding-top:30px; height:0; overflow:hidden;}\ndiv.guteurlsVideo iframe { position:absolute; top:0; left:0; width:100%; height: 100%;}\ndiv.guteurlsBox div.guteurlsImg {margin:0; width: 100%; min-height: 50px; background-size:cover;} \ndiv.guteurlsBox > div.guteurlsImg {box-shadow: 1px 1px 5px #aaa} \ndiv.guteurlsBox div.guteurlsImg img {margin:0; width: 100%; min-height: 50px; border: none} \ndiv.guteurlsBox div.guteurlsImg201610 {margin:0; width: 100%; min-height: 50px; " + strHideImg + "} \ndiv.guteurlsBox div.guteurlsImg201610 img {box-shadow: 1px 1px 5px #aaa; margin:0; padding:0; width: 100%; min-height: 50px; max-height: 1000px;} \ndiv.guteurlsBox a.guteurlsRead { color: rgb(21, 120, 143); } \ndiv.guteurlsBox > h1 {color: #464646; font-family: Oxygen, Arial, 'Helvetica Neue', Helvetica, sans-serif; font-weight: normal; font-style: normal; text-decoration: none; vertical-align: baseline; margin: 5px 0 2px 0; font-size: 14px; line-height: 16px}\ndiv.guteurlsBox > p {display: block; font-family: Oxygen, Arial, 'Helvetica Neue', Helvetica, sans-serif; font-weight: normal; font-style: normal; font-size: 12px; line-height: 16px; text-decoration: none; vertical-align: baseline; margin: 5px 0 5px 0; }\ndiv.guteurlsBox div.guteurlsNoTitleButUrl {display: block; font-family: Oxygen, Arial, 'Helvetica Neue', Helvetica, sans-serif; font-weight: normal; font-style: normal; font-size: 13px; line-height: 20px; text-decoration: none; vertical-align: baseline; overflow: hidden;}\ndiv.guteurlsBox div.guteurlsBottom {display: block; font-family: Oxygen, Arial, 'Helvetica Neue', Helvetica, sans-serif; font-weight: normal; font-style: normal; font-size: 13px; line-height: 20px; text-decoration: none; vertical-align: baseline; margin: 0 0 10px 0}\ndiv.guteurlsBox a.guteurlsGU, div.guteurlsBox span.guteurlsGU { border: none; box-shadow: none; text-decoration: none; color: rgb(21, 120, 143); line-height: 18px; font-size: 13px; height: 20px; padding:0 5px 0 0; display: block; float:right } \n@media only screen and (min-width: 42em) {\ndiv.guteurlsBox div.guteurlsTop { line-height: 20px; font-size: 20px; height: 22px;}\ndiv.guteurlsBox > h1 {font-size: 24px; line-height: 26px}\ndiv.guteurlsBox > p {font-size: 13px; line-height: 20px;}\n}\n</style>"), document.guteUrls.fStyleAdded = 1
            }
            document.guteUrls.nHeadCheckSum = document.head.innerHTML.length + 2 * document.head.innerHTML.match(/[ao]/gi).length + 3 * document.head.innerHTML.match(/[iu]/gi).length + 4 * document.head.innerHTML.match(/ /gi).length, document.guteUrls.arrDisplayedUrls = [], document.guteUrls.doneFunction = scriptTag.attr("callback"), document.guteUrls.afterInitFunction = scriptTag.attr("init"), document.guteUrls.callbackA = scriptTag.attr("callback-a"), document.guteUrls.fLocal = scriptTag.attr("local") ? 1 : 0, document.guteUrls.fCache = scriptTag.attr("nocache") ? 0 : 1, document.guteUrls.nWP = scriptTag.attr("wp") ? scriptTag.attr("wp") : 0, document.guteUrls.fUrlMultiple = scriptTag.attr("multiple") ? 1 : 0, document.guteUrls.strGif = scriptTag.attr("gif") ? scriptTag.attr("gif") : document.location.protocol + "//guteurls.de/loading.gif", document.guteUrls.strSelector = scriptTag.attr("selector"), jQuery('span[guteurls-remove="true"],div[guteurls-remove="true"],span.guteurlsRemove,div.guteurlsRemove').remove();
            var str = scriptTag.attr("email");
            if (str && (document.guteUrls.isEmailValid(str) || /^[a-zA-Z0-9=-]{6,100}=$/.test(str)) && (document.guteUrls.strEmail = str), str = scriptTag.attr("ignore"), str = (str ? str + "," : "") + ",:localhost,:127.0.0.1,horos,cc.bingj.com,lelekdonor.hu,prospvera.cf,:" + location.hostname, document.guteUrls.arrIgnoreUrls = document.guteUrls.prepareIgnoreAllow(str), document.guteUrls.arrIgnoreUrls[document.guteUrls.arrIgnoreUrls.length] = new RegExp(/^#/), str = scriptTag.attr("allow"), str && str.length > 1 && (document.guteUrls.arrAllowUrls = document.guteUrls.prepareIgnoreAllow(str)), document.guteUrls.fDebug && console.log("guteurls.jQueryReady() cache " + document.guteUrls.fCache), document.guteUrls.fDebug = scriptTag.attr("debug") ? 1 : 0, !document.guteUrls.strSelector) return alert("script src=https://guteurls.de/guteurls.js selector=...> Tag not found");
            if (document.guteUrls.fDebug && console.log("guteurls.strSelector = " + document.guteUrls.strSelector), document.guteUrls.afterInitFunction) {
                var obj = eval(document.guteUrls.afterInitFunction);
                jQuery.isFunction(obj) ? obj(jQuery) : ("string" == typeof obj || obj instanceof String) && window.setTimeout(document.guteUrls.afterInitFunction, 200, jQuery)
            }
            "3" == document.guteUrls.nWP ? (document.guteUrls.prepareWPManual(), document.guteUrls.replaceGuteUrls()) : document.guteUrls.nWP ? (document.guteUrls.prepareWPManual(), document.guteUrls.prepare()) : document.guteUrls.prepare()
        } catch (a) {
            document.guteUrls.fRunning = 0, console.log("guteUrls.jQueryReady guException: " + a)
        }
    }, this.selectorOptimazation = function() {
        if (document.guteUrls.nWP) {
            var a = (document.guteUrls.jQuery, document.guteUrls.jQuery),
                b = document.guteUrls.strSelector.indexOf(" p") < 0 ? 0 : 1,
                c = b ? " p" : "",
                d = a(".post .entry-content" + c);
            return d.length ? d : (d = a(".post .elements-box " + c), d.length ? d : a("div.djklhdsad"))
        }
    }, this.prepareIgnoreAllow = function(a) {
        if (!a && !a.trim().length) return !1;
        for (var b = [], c = a.split(","), d = 0; d < c.length; d++) a = c[d].trim(), a.length > 1 && (a = a.replace(/[-\/\\^$+?.()|[\]{}]/g, "\\$&"), a = a.replace(/[*]/g, ".*"), b[b.length] = new RegExp(a));
        return b.length || (b = null), b
    }, this.ignoreUrl = function(a) {
        if (a && document.guteUrls.arrIgnoreUrls)
            for (var b = 0; b < document.guteUrls.arrIgnoreUrls.length; b++)
                if (a.match(document.guteUrls.arrIgnoreUrls[b])) return 1;
        return 0
    }, this.allowUrl = function(a) {
        if (!a) return 0;
        if (!document.guteUrls.arrAllowUrls) return 1;
        for (var b = 0; b < document.guteUrls.arrAllowUrls.length; b++)
            if (a.match(document.guteUrls.arrAllowUrls[b])) return 1;
        return 0
    }, this.findAHrefUrlsDom = function(a, b) {
        var c = (document.guteUrls.jQuery, document.guteUrls.jQuery);
        a || (a = []);
        for (var d = b.find("a"), e = 0; e < d.length; e++) {
            var f = c(d[e]);
            if (!f.attr("gute-url-prepare") && !f.attr("noguteurl")) {
                var g = 1,
                    h = f.attr("href");
                if ("www.jagobiz.com" == document.location.hostname) {
                    for (var i = f.find("img:visible, div:visible, video:visible"), j = 0; j < i.length; j++) {
                        var k = c(i[j]);
                        if (k.height() && k.width() && (k.height() > 50 || k.width() > 50)) {
                            g = 0;
                            break
                        }
                    }
                    for (var i = f.find("img[src]:visible"), j = 0; j < i.length; j++) {
                        var k = c(i[j]);
                        if (k.attr("src") == h) {
                            g = 0;
                            break
                        }
                    }
                } else f.find("img, div, video").length && (g = 0);
                g && (a[a.length] = h)
            }
        }
        return a
    }, this.findTextUrls = function(a, b) {
        a || (a = []);
        var c = b.match(/(https?:\/\/[^\s]+)[\s]/gi);
        if (c || (c = b.match(/(https?:\/\/[^\s]+)$/gi)), c && c.length)
            for (var d = 0; d < c.length; d++) a[a.length] = c[d].trim();
        return a
    }, this.isUsedUrl = function(a) {
        if (document.guteUrls.fUrlMultiple) return 0;
        for (var b = 0; b < document.guteUrls.arrDisplayedUrls.length; b++)
            if (document.guteUrls.arrDisplayedUrls[b] == a) return 1;
        return 0
    }, this.filterUrls = function(a) {
        var b = [];
        if (a && a.length)
            for (var c = 0; c < a.length; c++) document.guteUrls.allowUrl(a[c]) && (document.guteUrls.ignoreUrl(a[c]) || document.guteUrls.isUsedUrl(a[c]) || (b[b.length] = a[c]));
        return b
    }, this.doCallbackA = function(jqEl, strUrl, jQuery) {
        if (document.guteUrls.callbackA) {
            var obj = eval(document.guteUrls.callbackA);
            jQuery.isFunction(obj) ? obj(jqEl, strUrl, jQuery) : ("string" == typeof obj || obj instanceof String) && window.setTimeout(document.guteUrls.callbackA, 200, jqEl, strUrl, jQuery)
        }
    }, this.fixWPShortcutProblem = function() {
        var a = document.guteUrls.jQuery,
            b = (document.guteUrls.jQuery, []);
        b[0] = a('span.gurlpb:contains("[urlpreviewbox")'), b[1] = a("p:contains(urlpreviewbox url)").filter(function() {
            return !a(this).children().length
        });
        for (var c = 0; c < b.length; c++)
            for (var d = b[c], e = 0; e < d.length; e++) {
                var f = a(d[e]),
                    g = f.text(),
                    h = g.match(/(http[^\"\â€³\â€&]*)/i);
                h && h.length && h[0] ? f.html('<a class="gurlpb" href="' + h[0] + '" style="visibility:visible">UrlPreviewBox</a>') : f.remove()
            }
    }, this.rmSpanGurlpb = function() {
        for (var a = (document.guteUrls.jQuery, document.guteUrls.jQuery), b = a("span.gurlpb>span[guteurls]"), c = 0; c < b.length; c++) {
            var d = a(b[c]),
                e = d.parent();
            e.replaceWith(d)
        }
    }, this.prepareWPManual = function() {
        try {
            document.guteUrls.fDebug && console.log("guteurls.prepareWPManual()");
            var a = document.guteUrls.jQuery,
                b = document.guteUrls.jQuery;
            document.guteUrls.fixWPShortcutProblem(), document.guteUrls.rmSpanGurlpb();
            for (var c = b("span[guteurls], a.gurlpb[href]"), d = 0; d < c.length; d++) {
                var e = b(c[d]),
                    f = "",
                    g = "",
                    h = e.attr("guteurls") ? e.attr("guteurls") : e.attr("href");
                if (h && !document.guteUrls.isUsedUrl(h)) {
                    e.parent().is("p") && 1 == e.parent().children().length && (f = e[0].previousSibling && e[0].previousSibling.nodeValue ? e[0].previousSibling.nodeValue.trim() : "", g = e[0].nextSibling && e[0].nextSibling.nodeValue ? e[0].nextSibling.nodeValue.trim() : "", e = e.parent());
                    var i = "guteUrlsP" + document.guteUrls.arrDisplayedUrls.length;
                    document.guteUrls.arrDisplayedUrls[document.guteUrls.arrDisplayedUrls.length] = h, e.replaceWith(("" == f ? "" : "<p>" + f + "</p>") + '<div class="guteUrls" gute-url="' + h + '" id="' + i + '"><a href="' + h + '" gute-url-prepare="1"><br /><center><img src="' + document.guteUrls.strGif + '" style="height:15px"/></center></a></div>' + ("" == g ? "" : "<p>" + g + "</p>")), document.guteUrls.doCallbackA(b("#" + i), h, a)
                }
            }
            return
        } catch (a) {
            document.guteUrls.fRunning = 0, console.log("guteUrls.prepareWPManual" + a)
        }
    }, this.prepare = function() {
        try {
            document.guteUrls.fDebug && console.log("guteurls.prepare()");
            var a, b = document.guteUrls.jQuery,
                c = document.guteUrls.jQuery,
                a = c(document.guteUrls.strSelector);
            !a.length && document.guteUrls.nWP && (a = document.guteUrls.selectorOptimazation());
            for (var d = 0; d < a.length; d++) {
                var e = c(a[d]);
                document.guteUrls.fDebug && console.log("guteurls.prepare() div found");
                var f = e.data("guteurls-url");
                f = f ? f : e.find("div.guteUrls").length, f = f ? f : e.closest("div.guteUrls").length, e.data("guteurls-url", "parsed");
                var g = e.html() ? e.html() : null;
                if (g && !f)
                    if (g.indexOf("http") < 0) e.data("guteurls-url", "parsed");
                    else if (g.indexOf("http") != -1) {
                    document.guteUrls.fDebug && console.log("guteurls.prepare() http in div found");
                    var h = "",
                        i = b.trim(e.text()),
                        j = document.guteUrls.findTextUrls([], i);
                    if (j = document.guteUrls.findAHrefUrlsDom(j, e), j = document.guteUrls.filterUrls(j), j.length && (h = j[0]), h) {
                        document.guteUrls.fDebug && console.log("guteurls.prepare() add guteurls"), e.data("guteurls-url", h);
                        var k = "guteUrlsP" + document.guteUrls.arrDisplayedUrls.length;
                        document.guteUrls.arrDisplayedUrls[document.guteUrls.arrDisplayedUrls.length] = h;
                        var l = '<div class="guteUrls" gute-url="' + h + '" id="' + k + '"><a href="' + h + '" gute-url-prepare="1"><br /><center><img src="' + document.guteUrls.strGif + '" style="height:15px"/></center></a></div>';
                        if (l = '<br clear="all" style="clear:both"/>' + l + '<br clear="all" style="clear:both"/>', i == h) e.html(l);
                        else if (document.guteUrls.nWP) {
                            var m = e.children("p").last();
                            m && m.length ? b(l).insertAfter(m) : e.append(l)
                        } else e.append(l);
                        document.guteUrls.doCallbackA(c("#" + k), h, b)
                    }
                }
            }
            document.guteUrls.replaceGuteUrls()
        } catch (a) {
            document.guteUrls.fRunning = 0, console.log("guteUrls.prepare" + a)
        }
    }, this.replaceGuteUrls = function(a) {
        try {
            document.guteUrls.fDebug && console.log("guteurls.replaceGuteUrls()");
            var b = (document.guteUrls.jQuery, document.guteUrls.jQuery),
                c = b('div.guteUrls[gute-url*="http"]'),
                d = c.length;
            if (!d) return document.guteUrls.done();
            if (1 == document.guteUrls.fCache)
                for (var e = 0; e < c.length; e++) {
                    var f = b(c[e]);
                    document.guteUrls.replaceGuteUrlsWithCacheValues(f)
                }
            document.guteUrls.replaceGuteUrls2(c, 0)
        } catch (a) {
            document.guteUrls.fRunning = 0, console.log("guteUrls.replaceGuteUrls" + a)
        }
    }, this.replaceGuteUrlsWithCacheValues = function(a) {
        try {
            document.guteUrls.jQuery, document.guteUrls.jQuery;
            if (a.data("displaysCacheValue")) return;
            var b = a.attr("gute-url"),
                c = b.replace(/https?\:\/\//, "").replace(/([^a-z0-9]+)/gi, "-"),
                d = localStorage.getItem("guteurls-" + c);
            if (d) {
                var e = JSON.parse(d);
                if (e) {
                    a.html(e[0]).data("displaysCacheValue", "1"), document.guteUrls.addOnClick(a);
                    var f = document.guteUrls.nNow - e[1],
                        g = !(d.indexOf("/screenshot.php?u=") < 0);
                    if (!g && f >= 0 && f < document.guteUrls.nCacheSec) return document.guteUrls.fDebug && console.log("guteurls.replaceGuteUrls2() using cache. Value is " + f + " seconds old"), void a.data("skipAjaxLoad", "1")
                }
            }
        } catch (a) {
            document.guteUrls.fRunning = 0, console.log("guteUrls.replaceGuteUrlsWithCacheValues" + a)
        }
    }, this.replaceGuteUrls2 = function(a, b) {
        try {
            document.guteUrls.fDebug && console.log("guteurls.replaceGuteUrls2()");
            var c = document.guteUrls.jQuery,
                d = document.guteUrls.jQuery;
            if (a.length <= b) return void document.guteUrls.done();
            var e = d(a[b]),
                f = e.attr("gute-url"),
                g = f.replace(/https?\:\/\//, "").replace(/([^a-z0-9]+)/gi, "-");
            if (document.guteUrls.replaceGuteUrlsWithCacheValues(e), e.data("skipAjaxLoad")) return void document.guteUrls.replaceGuteUrls2(a, b + 1);
            var h = document.guteUrls.fLocal ? "http://test.guteurls.de/ajax.php/" + g : "https://guteurls.de/ajax.php/" + g,
                i = c("html").attr("lang");
            d.ajax(h, {
                data: {
                    html: 1,
                    u: e.attr("gute-url"),
                    r: document.location.href,
                    h: document.guteUrls.nHeadCheckSum,
                    e: document.guteUrls.strEmail,
                    d: document.guteUrls.fDebug,
                    w: document.guteUrls.nWP,
                    l: i ? i : ""
                },
                method: "POST",
                timeout: 3e4,
                success: function(c) {
                    var f = d("<div />").html(c);
                    e.data("skipAjaxLoad", "1");
                    var h = function(a, b) {
                        var c;
                        e.html(b).show(), document.guteUrls.addOnClick(e), c = a ? JSON.stringify([b, document.guteUrls.nNow]) : JSON.stringify([b, document.guteUrls.nNow + document.guteUrls.nCacheSec - 60]), document.guteUrls.fCache && localStorage.setItem("guteurls-" + g, c)
                    };
                    document.guteUrls.wait4Img(f, h, c), document.guteUrls.replaceGuteUrls2(a, b + 1)
                },
                error: function() {
                    console.log("guteUrls.ajax.error timeout"), e.data("hasCacheValue") || e.hide(), document.guteUrls.replaceGuteUrls2(a, b + 1)
                }
            })
        } catch (a) {
            document.guteUrls.fRunning = 0, console.log("guteUrls.replaceGuteUrls2" + a)
        }
    }, this.wait4Img = function(a, b, c) {
        try {
            var d = (document.guteUrls.jQuery, document.guteUrls.jQuery),
                e = a.find("div.guteurlsImg201610 img").first();
            if (!e.length) return void b(1, c);
            var f = 0,
                g = e.attr("src");
            if (!g || !g.match(/^http....../i)) return void b(1, c);
            var h = d("<img />");
            return h.bind("load", function() {
                f = 1, b(1, c)
            }), h.bind("error", function() {
                f = 1, console.log("Can not load " + g), 0 == g.toLowerCase().indexOf("http:") && "https:" == location.protocol && console.log("This page is https, but the image is http. THAT IS A PROBLEM"), c = c.replace(g, "https://guteurls.de/images/backgrounds/windows-1076116-768x391.jpg"), c = c.replace(g, "https://guteurls.de/images/backgrounds/windows-1076116-768x391.jpg"), b(0, c)
            }), h.attr("src", g), void window.setTimeout(function() {
                f || h[0].complete && (f = 1, b(1, c))
            }, 2e3)
        } catch (a) {
            console.log("guteUrls.backgroundImgFix" + a)
        }
    }, this.addOnClick = function(a) {
        var b = "return document.guteUrls.onClick('" + a.attr("gute-url") + "')";
        a.find("div.guteurlsImg201610 a, a.guteurlsRead").attr("onclick", b)
    }, this.onClick = function(a) {
        try {
            document.guteUrls.fDebug && console.log("guteurls.onClick()");
            var b = (document.guteUrls.jQuery, document.guteUrls.jQuery);
            if (!a) return !0;
            var c = document.guteUrls.fLocal ? "http://test.guteurls.de/click.php" : "https://guteurls.de/click.php";
            b.ajax(c, {
                data: {
                    u: a,
                    r: document.location.href,
                    h: document.guteUrls.nHeadCheckSum
                },
                method: "POST",
                timeout: 3e3,
                success: function(a) {
                    console.log("guteUrls.onClick sent")
                },
                error: function() {
                    console.log("guteUrls.onClick error/timeout")
                }
            })
        } catch (a) {
            console.log("guteUrls.onClick" + a)
        }
        return !0
    }, this.done = function() {
        try {
            document.guteUrls.fDebug && console.log("guteurls.done()"), document.guteUrls.fRunning = 0;
            for (var jQuery = document.guteUrls.jQuery, $ = document.guteUrls.jQuery, i = 0, len = localStorage.length; i < len; i++) {
                var str = localStorage.key(i);
                if (str && (document.guteUrls.fDebug && console.log("guteurls.done() cache obj " + str.substr(0, 20)), 0 == str.indexOf("guteurls-"))) {
                    var arr = JSON.parse(localStorage[str]);
                    arr && "undefined" != typeof arr[1] && (document.guteUrls.fDebug && console.log("guteurls.done() cache obj age " + (document.guteUrls.nNow - arr[1])), document.guteUrls.nNow - arr[1] > document.guteUrls.nCacheSec && (document.guteUrls.fDebug && console.log("guteurls.done() del cache obj - age " + (document.guteUrls.nNow - arr[1]) + " " + arr[0].substr(0, 20)), localStorage.removeItem(str)))
                }
            }
            if (document.guteUrls.doneFunction) {
                var obj = eval(document.guteUrls.doneFunction);
                jQuery.isFunction(obj) ? obj(jQuery) : ("string" == typeof obj || obj instanceof String) && window.setTimeout(document.guteUrls.doneFunction, 200, jQuery)
            }
        } catch (a) {
            console.log("guteUrls.done" + a)
        }
    }
}
if (document.guteUrls) try {
    console.log("gute url already executed ")
} catch (a) {
    console.log("GuteUrls " + a + " " + document.guteUrls)
} else try {
    guteUrls = new GuteUrlsClass, document.guteUrls = guteUrls, document.guteUrls.execute()
} catch (a) {
    console.log("GuteUrlsClass " + a + " " + document.guteUrls)
}