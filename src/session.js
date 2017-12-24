/*
* Session类
* 创建一个新的session管理对象
* 作者：wubo
* 2017-12-18
*/
const MD5 = require('md5'); 
class Session {
  /**
   * 初始化一个session管理对象
   * @param {time} 设定session清理频次 默认60*1000 毫秒
   * @param {maxAge} string 代表Date.now()到期的毫秒数 默认 24 * 60 * 60 * 1000 / 24 hours
   * @param {key} string session加密key自定义字符串
   * @param {httpOnly} boolean 一个布尔值，用于指示cookie是否仅通过HTTP（S）发送，并且不会提供给客户端
   * JavaScript（true默认情况下）。
   * @param {path} string 该Cookie的使用路径。如果设置为“/sessionWeb/”，则只有contextPath为“/sessionWeb”的程
   * 序可以访问该Cookie。如果设置为“/”，则本域名下contextPath都可以访问该Cookie。注意最后一个字符必须为“/”
   * @param {domain} string 可以访问该Cookie的域名。如果设置为“.google.com”，则所有以“google.com”结尾的域名
   * 都可以访问该Cookie。注意第一个字符必须为“.”
   * @param {secure} boolean 该Cookie是否仅被使用安全协议传输。安全协议。安全协议有HTTPS，SSL等，在网络上传输数据
   * 之前先将数据加密。默认为false
   * @author wubo
   * @returns session
   */
  constructor ({time = 60 * 1000, key = '我爱中国', maxAge = 24 * 60 * 60 * 1000, httpOnly = true, domain = '', path = '/', secure = false} = {}) {
    this.time = time;
    this.key = key;
    this.maxAge = maxAge;
    this.httpOnly = httpOnly;
    this.domain = domain;
    this.path = path;
    this.secure = secure;

    this.sessions = {};
    this.length = 0;
    this.setSessionClear();
  }

  // 获取session数据
  get(key, domain){
    if(!key || !this.isin(key)){
      let nowtime = new Date().getTime()
      key = MD5('' + nowtime + this.key + 'UMDSSID');
      this.length++
      this.sessions[key] = {
        key: key,
        timeout: nowtime + this.maxAge,
        httpOnly: this.httpOnly,
        maxAge: this.maxAge,
        path: this.path,
        domain: domain || this.domain,
        secure: this.secure,
        setMaxAge(time){
          this.maxAge = time;
          this.timeout = new Date().getTime() + time;
        }
      };
    }
    return this.sessions[key];
  }

  // 清理session数据
  clear(){
    this.sessions = {}
  }

  // 查看对象是否存在
  isin(key){
    return this.sessions[key] ? true : false;
  }

  // 手动剔除过期对象
  sessionClear(){
    var nowtime = new Date().getTime();
    if(Object.keys(this.sessions).length){
      for(let key in this.sessions){
        if(this.sessions[key].timeout < nowtime){
          delete this.sessions[key]
          this.length--
        }
      }
    }
  }
  
  // 定时剔除session过期的对象
  setSessionClear(time){
    setInterval(()=>{
      this.sessionClear()
    }, time);
  }

  // 查看session对象数据
  getSessions(){
    return this.sessions;
  }

  formatCooike(session){
    return `ubmssid=${session.key};expires=${new Date(session.timeout).toGMTString()};domain=${session.domain};path=${session.path};${session.secure}${session.httpOnly ? ';HttpOnly': '' }`.trim();
  }
}

module.exports = Session;
