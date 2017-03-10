gulp       = require 'gulp'
sass       = require 'gulp-sass'
reload     = require('browser-sync').reload
config     = require './config'
sourcemaps = require 'gulp-sourcemaps'

gulp.task 'sass', ->
  gulp.src([config.themePath + '/sass/*.sass'])
      .pipe(
        sourcemaps.init())
      .pipe(
          sass())
      .pipe(
          sourcemaps.write('./maps'))
      .pipe(
          gulp.dest(config.themePath))
      .pipe(
          reload(stream: true))
