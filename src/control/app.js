const pool = require('../mysql');
const MD5 = require('md5')
module.exports = {
  select(param, rm) {
    if (param.session.user) {
      pool.getConnection(function (err, connection) {
        connection.query(`SELECT * FROM app where user_id='${param.session.user.id}' LIMIT ${param.data.row} OFFSET ${(param.data.page-1)*param.data.row}`, function (error, results, fields) {
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
      pool.getConnection(function (err, connection) {
        connection.query(`insert into app (user_id, app_name, app_dep, app_key) values('${param.session.user.id}' ,'${param.data.appName}','${param.data.appDep}','${MD5(param.data.appName + param.data.appDep + param.session.user.id)}')`, function (error, results, fields) {
          connection.release();
          if (error) {
            param.resEnd(200, param.getResData('添加失败', error, 0))
          } else {
            param.resEnd(200, param.getResData('添加成功'))
          };
        });
      });
    } else {
      param.resEnd(200, param.getResData('登录信息已经过期', {
        code: 700
      }, 0))
    }
  },
  put(param, rm) {
    if (param.session.user) {
      pool.getConnection(function (err, connection) {
        connection.query(`update app set app_name='${param.data.appName}', app_dep='${param.data.appDep}', app_key='${MD5(param.data.appName + param.data.appDep + param.session.user.id)}' where id='${param.uriParam.id}'`, function (error, results, fields) {
          connection.release();
          if (error) {
            param.resEnd(200, param.getResData('修改失败', {}, 0))
          } else {
            param.resEnd(200, param.getResData('修改成功'))
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
        connection.query(`delete from app where id='${param.uriParam.id}'`, function (error, results, fields) {
          connection.release();
          if (error) {
            param.resEnd(200, param.getResData('删除失败', {}, 0))
          } else {
            param.resEnd(200, param.getResData('删除成功'))
          };
        });
      });
    } else {
      param.resEnd(200, param.getResData('登录信息已经过期', {
        code: 700
      }, 0))
    }
  },
  all(param, rm) {
    if (param.session.user) {
      pool.getConnection(function (err, connection) {
        connection.query(`SELECT id,app_name,app_key FROM app where user_id='${param.session.user.id}'`, function (error, results, fields) {
          connection.release();
          if (error) {
            param.resEnd(200, param.getResData('获取失败', {}, 0))
          } else {
            param.resEnd(200, param.getResData('获取成功', results))
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
