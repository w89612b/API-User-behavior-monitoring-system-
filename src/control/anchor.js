const pool = require('../mysql');
module.exports = {
  select(param, rm) {
    if (param.session.user) {
      pool.getConnection(function (err, connection) {
        connection.query(`SELECT * FROM anchor where user_id='${param.session.user.id}' ${param.data.appKey ? "and app_key='" + param.data.appKey + "'" : '' } LIMIT ${param.data.row} OFFSET ${(param.data.page-1)*param.data.row}`, function (error, results, fields) {
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
        connection.query(`insert into anchor (user_id, anchor_name, anchor_dep, anchor_location, app_key) values('${param.session.user.id}' ,'${param.data.anchorName}','${param.data.anchorDep}','${param.data.anchorLocation}','${param.data.appKey}')`, function (error, results, fields) {
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
        connection.query(`update anchor set anchor_name='${param.data.anchorName}', anchor_dep='${param.data.anchorDep}', anchor_location='${param.data.anchorLocation}', app_key='${param.data.appKey}' where id='${param.uriParam.id}'`, function (error, results, fields) {
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
        connection.query(`delete from anchor where id='${param.uriParam.id}'`, function (error, results, fields) {
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
    pool.getConnection(function (err, connection) {
      connection.query(`SELECT id,anchor_name FROM anchor where app_key = '${param.data.appKey}'`, function (error, results, fields) {
        connection.release();
        if (error) {
          param.resEnd(200, param.getResData('添加失败', error, 0))
        } else {
          param.resEnd(200, param.getResData('添加成功', results, 1))
        };
      });
    });
  }
};
