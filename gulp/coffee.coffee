gulp       = require 'gulp'
gutil      = require 'gulp-util'
coffee     = require 'gulp-coffee'
config     = require './config'
sourcemaps = require 'gulp-sourcemaps'

gulp.task 'coffee', ->
  gulp.src(config.themePath + '/coffee/*.coffee')
      .pipe(
        sourcemaps.init())
      .pipe(
          coffee({bare: true}).on('error', gutil.log))
      .pipe(
          sourcemaps.write())
      .pipe(
          gulp.dest(config.themePath + '/js'))
