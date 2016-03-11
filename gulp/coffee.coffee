gulp   = require 'gulp'
gutil  = require 'gulp-util'
coffee = require 'gulp-coffee'
config = require './config'

gulp.task 'coffee', ->
  gulp.src(config.themePath + '/coffee/*.coffee')
      .pipe(
          coffee({bare: true}).on('error', gutil.log))
      .pipe(
          gulp.dest(config.themePath + '/js'))
