gulp        = require 'gulp'
browserSync = require 'browser-sync'
config      = require './config'

gulp.task 'browser-sync', ->
  configServer = config.browsersync

  ip = config.dockerIp

  configServer.proxy.target = configServer.proxy.target.replace('DOCKER_IP', ip)

  browserSync.init configServer
