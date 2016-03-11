gulp   = require 'gulp'
sass   = require 'gulp-sass'
reload = require('browser-sync').reload
config = require './config'

gulp.task 'sass', ->
  gulp.src([config.themePath + '/sass/*.sass',
            config.themePath + '/sass/*.scss'])
      .pipe(
          sass())
      .pipe(
          gulp.dest(config.themePath))
      .pipe(
          reload(stream: true))
