const ServerManage = require('./ServerManage');
const pool = require('./mysql');
const route = require('./route')
const app = new ServerManage();
// 初始化持久化路由信息
pool.getConnection((err, connection) => {
  connection.query('SELECT uri, uri_name, uri_body FROM uri', (error, results, fields) => {
    connection.release();
    if (error) {
      console.log('uri query error');
    } else {
      // 如果存在持久化的路由添加到基本业务路由后面
      results.map((item) => {
        var uri = item.uri
        route.routers.push({
          uri: uri.startsWith('/') ? '/common/' + uri.substr(1, uri.length) : uri,
          callback: JSON.parse(item.uri_body)
        })
      });
      app.routers = route.routers;
      app.listen(8000)
    }
  });
});
