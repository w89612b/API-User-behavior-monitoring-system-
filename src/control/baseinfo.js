const pool = require('../mysql');
module.exports = {
  selectAll(param, rm){
    if (param.session.user){
      pool.getConnection(function (err, connection) {
        connection.query(`SELECT * FROM baseinfo where app_key='${param.data.appKey}' ${param.data.anchorId ? "AND anchor_id='" + param.data.anchorId + "'" : ''} LIMIT ${param.data.row} OFFSET ${(param.data.page-1)*param.data.row}`, function (error, results, fields) {
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
  add(param, rm){
    var ua = rm.formatUA(param.req.headers['user-agent']);
    pool.getConnection(function (err, connection) {
      connection.query(`insert into baseinfo (app_key, anchor_id, req_uri, user, ua_body, user_os, user_device, user_browser, user_engine) values('${param.data.appKey}' ,'${param.data.anchorId}','${param.req.headers.referer}','${param.data.user}','${ua.ua}','${JSON.stringify(ua.os)}','${JSON.stringify(ua.device)}','${JSON.stringify(ua.browser)}','${JSON.stringify(ua.engine)}')`, function (error, results, fields) {
        connection.release();
        if (error) {
          param.resEnd(200, param.getResData('添加失败', error, 0))
        } else {
          param.resEnd(200, param.getResData('添加成功', {
            userid: param.session.userid
          }, 1))
        };
      });
    });
  }
}
