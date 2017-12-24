const pool = require('../mysql');
const MD5 = require('md5');
module.exports = {
  signup(param, rm) {
    pool.getConnection((err, connection) => {
      connection.query(`SELECT * FROM user where user_name='${param.data.userName}'`, (error, results, fields) => {
        connection.release();
        if (error) {
          param.resEnd(200, param.getResData('服务器错误', {}, 0))
        } else {
          if (results[0] && param.data.userPwd === results[0].user_pwd) {
            param.session.user = results[0];
            param.session.user.key = MD5(`${results[0].user_name}${results[0].user_pwd}${results[0].id}`)
            param.resEnd(200, param.getResData('登录成功！', {userName: results[0].user_name, key: param.session.user.key, img: '/static/head.jpg'}, 1))
          } else {
            param.resEnd(200, param.getResData('用户名或密码错误', {}, 0))
          }
        }
      });
    });
  },
  signin(param, rm) {
    if (param.data) {
      pool.getConnection(function (err, connection) {
        connection.query(`SELECT * FROM user where user_name='${param.data.userName}'`, (error, results, fields) => {
          if (error) {
            throw error;
            param.resEnd(200, param.getResData('服务器错误！', {}, 0))
          } else {
            if (results[0] && results[0].id) {
              param.resEnd(200, param.getResData('用户名已经存在！', {}, 0))
            } else {
              connection.query(`insert into user (user_name, user_pwd) values('${param.data.userName}','${param.data.userPwd}')`, (error, results, fields) => {
                connection.release();
                if (error) {
                  param.resEnd(200, param.getResData('服务器错误！', {}, 0))
                } else {
                  param.resEnd(200, param.getResData('注册成功！', {}, 1))
                };
              });
            }
          };
        });
      });
    } else {
      param.resEnd(200, param.getResData('参数为空！', {}, 0))
    }
  },
  signout(param, rm) {
    param.session.user = null;
    param.resEnd(200, param.getResData('注册成功！', {}, 1))
  }
};
