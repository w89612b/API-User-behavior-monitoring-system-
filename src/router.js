// ua分析工具
const UA = require('ua-parser-js');
const pathToRegexp = require('path-to-regexp');
// 路由控制器
class Router {
  constructor() {
    // 缓存路由信息集
    this.routers = {};
  }

  // 判断请求资源路径是否在缓存里面
  isin(uri) {
    var routers = this.routers;
    if(routers[uri]){
      return true;
    } else {
      for(let url in routers) {
        var item = routers[url]
        if(item.uriRegexp){
          if(uri.match(item.uriRegexp)){
            return true;
          }
        }
      }
    }
    return false;
  }

  // 添加和覆盖资源
  addRouter(router) {
    var uri = router.uri, resUris;
    if(uri.indexOf(':') !== -1){
      resUris = this.formatParamsRestFul(uri);
      router.uriRegexp = resUris.uriRegexp;
      router.ParsetParam = resUris.args;
      this.routers[router.uri] = router;
    } else {
      this.routers[router.uri] = router;
    }
  }

  // 获取资源对应router 
  getRouter(uri) {
    var routers = this.routers, uris = uri.split('?'), param, router;
    if(routers[uris[0]]){
      router = routers[uris[0]];
      // 处理URL参数
      router.uriParam = uris[1] ? this.formatParamsRegex(uris[1]) : null
      return router;
    } else {
      for(let url in routers) {
        var item = routers[url]
        if(item.uriRegexp){
          if(uris[0].match(item.uriRegexp)){
            var uriParam = {}, 
            args = item.ParsetParam,
            l = args.length,
            targs = uri.match(item.uriRegexp).toString().split(','),
            params = uris[1] ? this.formatParamsRegex(uris[1]) : null;
            targs.splice(0,1)
            // 处理RESTFulURL参数
            for(let i= 0; i < l ; i++){
              uriParam[args[i]] = targs[i]
            }
            // 处理RESTFulURL普通参数
            if(params){
              for(let key in params) {
                uriParam[key] = params[key];
              }
            }
            item.uriParam = uriParam
            return item;
          }
        }
      }
    }
  }

  // 删除路由
  delRouter(uri){
    var routers = this.routers;
    if(routers[uri]){
      delete routers[uri]
      console.log(uri)
    } else {
      for(let url in routers) {
        var item = routers[url]
        if(item.uriRegexp){
          if(uri.match(item.uriRegexp)){
            delete routers[url]
            console.log(uri)
          }
        }
      }
    }
  }

  // 设置资源处理方法
  setRouterdata(uri, body) {
    this.routers[uri].body = body;
  }
  // RestFul URI 参数格式化
  formatParamsRestFul(uri) {
    var argt = uri.split(':')[1].split('/'),
      args = [],
      i = argt.length,
      l = 0;
    do {
      args[l++] = argt[--i];
    } while (i > 0);
    return {
      uriRegexp: pathToRegexp(uri),
      args: args
    };
  }
  // 请求资源参数格式化 常规
  formatParams(arg) {
    console.time('getParam')
    var argt = arg.split('&'),
      args = {},
      i = argt.length,
      temp;
    do {
      temp = argt[--i];
      temp = temp.split('=');
      args[temp[0]] = temp[1];
    } while (i > 0);
    console.timeEnd('getParam')
    return args;
  }

  // 请求资源参数格式化 正则匹配
  formatParamsRegex(_url) {
    console.time('parse_url')
    var pattern = /(\w+)=(\w+)/ig;
    var parames = {};
    _url.replace(pattern, function (a, b, c) {
      parames[b] = c;
    });
    console.timeEnd('parse_url')
    return Object.keys(parames) ? parames : null;
  }

  // 通过用户提交数据格式化路由信息
  formatRouter(req) {
    let url = req.url;
    return {
      'accept': req.headers.accept,
      'host': req.headers.host,
      'uainfo': UA(req.headers['user-agent']),
      'connection': req.headers.connection,
      'method': req.method,
      'httpVersion': req.httpVersion,
      'uri': url,
      'param': null,
      'body': req.body || null
    }
  }
  // 格式化UA信息
  formatUA(ua) {
    return UA(ua)
  }
}

module.exports = Router;
