const mysql = require('mysql');
const config = {
  connectionLimit : 10,
  host     : 'localhost',
  user     : 'root',
  password : '123456',
  database : 'ubm'
}
const pool = mysql.createPool(config);
pool.getConnection((err, connection)=>{
  if(err){
    console.log(`数据库链接失败！错误：${err.sqlMessage} ${err.Error} `)
  }
})
module.exports = pool;
