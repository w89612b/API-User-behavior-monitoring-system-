const baseinfo = require('./control/baseinfo')
const uri = require('./control/uri')
const user = require('./control/user')
const anchor = require('./control/anchor')
const app = require('./control/app')

module.exports.routers = [{
  uri: '/api/baseinfo/list',
  callback: baseinfo.selectAll
}, {
  uri: '/api/baseinfo/add',
  callback: baseinfo.add
}, {
  uri: '/api/app/list',
  callback: app.select
}, {
  uri: '/api/app/add',
  callback: app.add
}, {
  uri: '/api/app/put/:id',
  callback: app.put
}, {
  uri: '/api/app/del/:id',
  callback: app.del
}, {
  uri: '/api/app/all',
  callback: app.all
}, {
  uri: '/api/anchor/list',
  callback: anchor.select
}, {
  uri: '/api/anchor/add',
  callback: anchor.add
}, {
  uri: '/api/anchor/put/:id',
  callback: anchor.put
}, {
  uri: '/api/anchor/del/:id',
  callback: anchor.del
}, {
  uri: '/api/anchor/all',
  callback: anchor.all
}, {
  uri: '/api/u/signup',
  callback: user.signup
}, {
  uri: '/api/u/signin',
  callback: user.signin
}, {
  uri: '/api/u/signout',
  callback: user.signout
}, {
  uri: '/api/uri/list',
  callback: uri.select
}, {
  uri: '/api/uri/add',
  callback: uri.add
}, {
  uri: '/api/uri/put/:id',
  callback: uri.put
}, {
  uri: '/api/uri/del/:id',
  callback: uri.del
}]
