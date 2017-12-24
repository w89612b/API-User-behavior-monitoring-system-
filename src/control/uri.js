const pool = require('../mysql');
module.exports = {
  select(param, rm) {
    if (param.session.user) {
      pool.getConnection(function (err, connection) {
        connection.query(`SELECT id, uri, uri_name, uri_body FROM uri where user_id='${param.session.user.id}' LIMIT ${param.data.row} OFFSET ${(param.data.page-1)*param.data.row}`, function (error, results, fields) {
          connection.release();
          if (error) {
            param.resEnd(200, param.getResData('查询失败', error, 0))
          } else {
            param.resEnd(200, param.getResData('查询成功', results, 1))
          }
        });
      });
    } else {
      param.resEnd(200, param.getResData('登录信息已经过期', {
        code: 700
      }, 0))
    }
  },
  add(param, rm) {
    if (param.session.user) {
      if (param.data.uri.startsWith('/api/')) {
        param.resEnd(200, param.getResData('自定义uri不能以api开头!', {}, 0))
      } else {
        var router, isin = rm.isin(param.data.uri);
        pool.getConnection(function (err, connection) {
          connection.query(`SELECT id FROM uri where uri='${param.data.uri}' and user_id='${param.session.user.id}'`, function (error, results, fields) {
            if (error) {
              throw error;
            } else {
              var l = results.length;
              if (isin && l) {
                connection.release();
                param.resEnd(200, param.getResData('uri已存在请选择修改！', {}, 0))
              } else if(isin && !l){
                connection.release();
                param.resEnd(200, param.getResData('uri已被占用，请修改uri！', {}, 0))
              } else {
                param.req.url = param.data.uri.startsWith('/') ? '/common/' + param.data.uri.substr(1, param.data.uri.length) : param.data.uri
                console.log(param.req.url)
                param.req.body = JSON.parse(param.data.uriBody);
                router = rm.formatRouter(param.req);
                rm.addRouter(router)
                connection.query(`insert into uri (uri, uri_body, uri_name, user_id) values('${param.data.uri}',${JSON.stringify(param.data.uriBody)},'${param.data.uriName}', '${param.session.user.id}')`, function (error, results, fields) {
                  connection.release();
                  if (error) {
                    param.resEnd(200, param.getResData('失败', error, 0))
                  } else {
                    param.resEnd(200, param.getResData('成功!', router, 1))
                  };
                });
              }
            };
          });
        });
      }
    } else {
      param.resEnd(200, param.getResData('登录信息已经过期', {
        code: 700
      }, 0))
    }
  },
  put(param, rm) {
    if (param.session.user) {
      var router;
      param.req.url = param.data.uri.startsWith('/') ? '/common/' + param.data.uri.substr(1, param.data.uri.length) : param.data.uri
      param.req.body = JSON.parse(param.data.uriBody);
      router = rm.formatRouter(param.req);
      rm.addRouter(router)
      pool.getConnection(function (err, connection) {
        connection.query(`update uri set uri_body=${JSON.stringify(param.data.uriBody)},uri_name='${param.data.uriName}' where id='${param.uriParam.id}'`, function (error, results, fields) {
          connection.release();
          if (error) {
            param.resEnd(200, param.getResData('修改失败', error, 0))
          } else {
            param.resEnd(200, param.getResData('修改成功!', router, 1))
          };
        });
      });
    } else {
      param.resEnd(200, param.getResData('登录信息已经过期', {
        code: 700
      }, 0))
    }
  },
  del(param, rm) {
    if (param.session.user) {
      pool.getConnection(function (err, connection) {
        connection.query(`delete from uri where id='${param.uriParam.id}'`, function (error, results, fields) {
          connection.release();
          if (error) {
            param.resEnd(200, param.getResData('删除失败', {}, 0))
          } else {
            param.resEnd(200, param.getResData('删除成功'))
            rm.delRouter(param.data.uri)
          };
        });
      });
    } else {
      param.resEnd(200, param.getResData('登录信息已经过期', {
        code: 700
      }, 0))
    }
  }
};
