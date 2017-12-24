const fs = require('fs');
const Router = require('./router');
const Session = require('./session');
var route = new Router();
var session = new Session();
class RouterManage {
  constructor(req, res) {
    // 默认访问文件设置
    this.defaultlfile = 'index.html';
    // 请求体
    this.req = req;
    // 返回体
    this.res = res;
    this.init()
  }

  // 初始化处理方法
  init() {
    var dataArr = []
    this.req.on("data", (data) => {
      dataArr.push(data);
    });
    this.req.on("end", () => {
      var data = Buffer.concat(dataArr).toString(), ret;
      try {
        this.data = 'string' === typeof data ? data.includes('&') ? route.formatParamsRegex(data) : JSON.parse(data) : data;
      } catch (err) { }
      console.log(this.req)
      // 获得客户端的Cookie
      let Cookies = {}
      this.req.headers.cookie && this.req.headers.cookie.split(';').forEach(function( Cookie ) {
        let parts = Cookie.split('=');
        Cookies[ parts[ 0 ].trim() ] = ( parts[ 1 ] || '' ).trim();
      });
      if(Object.keys(Cookies).length){
        this.cookie = Cookies;
      }
      this.session = session.get(Cookies.ubmssid, this.req.headers.host.split(':')[0]);
      // 如果在路由中能找到路由
      if (route.isin(this.req.url.split('?')[0])) {
        var router = route.getRouter(this.req.url);
        // 如果路由内容是一个方法， 执行处理方法
        if ('function' === typeof router.body) {
          this.uriParam = router.uriParam || null
          router.body(this, route)
        // 如果路由是一个对象， 把对象返回给用户
        }else if ('object' === typeof router.body) {
          this.resEnd(200, this.getResData('获取成功', router.body, 1))
        // 如果路由是类型是字符串， 读取文件发送返回给用户
        } else if ('string' === typeof router.body) {
          this.resEnd(400, router.body)
        }
      // 不能找到路由信息和静态文件处理  
      } else {
        var filename = this.req.url === '/' ? '/'+this.defaultlfile : this.req.url;  //
        // 基于其扩展名推测内容类型
        var type = function(_type) {
            switch(_type) { // 扩展名
            case 'html':
            case 'htm': return 'text/html; charset=UTF-8';
            case 'js': return 'application/javascript; charset=UTF-8';
            case 'css': return 'text/css; charset=UTF-8';
            case 'txt': return 'text/plain; charset=UTF-8';
            case 'manifest': return 'text/cache-manifest; charset=UTF-8';
            default: return 'application/octet-stream';
            }
        }(filename.substring(filename.lastIndexOf('.') + 1));
        // 异步读取文件,并将内容作为单独的数据块传回给回调函数
        // 对于确实很大的文件,使用API fs.createReadStream()更好
        fs.readFile(__dirname + filename, 'utf8', (err, content) => {
          if (err) { // 如果由于某些原因无法读取文件
                this.res.writeHead(404, {'Content-type' : 'text/plain; charset=UTF-8'});
                this.res.write(err.message);
              } else { // 否则读取文件成功
                this.res.writeHead(200, {'Content-type' : type});
                this.res.write(content); // 把文件内容作为响应主体
              }
              this.res.end();
          });
      }
    })
  }

  // 响应数据处理方法
  getResData(msg = 'URI is undefine' , data = {}, code = 1) {
    return {
      data: data,
      msg: msg,
      code: code
    }
  }

  // 响应处理方法
  resEnd(state , data) {
    let type = "string" === typeof data;
    this.res.writeHead(state, {
      "Set-Cookie": session.formatCooike(this.session),
      "Content-type": type ? "text/html" : "application/json" 
    });
    this.res.write(type ? data : JSON.stringify(data));
    this.res.end();
  }
}

// 设置路由
RouterManage.setRouter = (routeData) => {
  routeData.map((item) => {
    route.addRouter({ uri: item.uri, body: item.callback })
  })
}


module.exports = RouterManage
