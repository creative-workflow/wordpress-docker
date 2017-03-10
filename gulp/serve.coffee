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

  # this task will not reload but update the browser css in place
  gulp.watch sassFiles, [ 'sass' ]

  gulp.watch config.themePath + '/coffee/**/*.coffee', [ 'coffee' ]

  # in case of changed js or php files -> reload the browser
  otherFiles = [
    config.themePath+'/**/*.js'
    config.themePath+'/**/*.php'
  ]
  gulp.watch otherFiles, reload
