const http = require('http');
var RouterManage = require('./routerManage');
class ServerManage {
  constructor(){
    this.routers = null;
  }

  callback() {
    return (req, res) =>{
      new RouterManage(req, res)
    }
  }

  listen(...args){
    RouterManage.setRouter(this.routers);
    const server = http.createServer(this.callback());
    server.listen(...args);
    console.info(`Your application is running here: http://localhost:${args}`)
  }
}

module.exports = ServerManage
