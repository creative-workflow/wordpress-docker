gulp   = require 'gulp'
reload = require('browser-sync').reload
config = require './config'

gulp.task 'serve', [
  'sass'
  'coffee'
  'browser-sync'
], ->
  sassFiles = [
    config.themePath + '/sass/**/*.sass',
    config.themePath + '/sass/**/*.scss'
  ]

  gulp.watch sassFiles, [ 'sass' ]

  gulp.watch config.themePath + '/coffee/**/*.coffee', [ 'coffee' ]

  otherFiles = [
    config.themePath+'/**/*.css'
    config.themePath+'/**/*.js'
    config.themePath+'/**/*.php'
  ]
  gulp.watch otherFiles, reload
