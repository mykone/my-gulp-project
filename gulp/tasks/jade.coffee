gulp = require('gulp')
jade = require('gulp-jade')
connect = require 'gulp-connect'
# gutil = require('gulp-util')
handleErrors = require('../util/handleErrors')

gulp.task 'jade', ->
#  gulp.src 'src/**/*.jade'
  gulp.src 'src/index.jade'
  .pipe jade pretty: true
  .pipe gulp.dest 'dist/'
  .pipe(connect.reload())
  .on 'error', handleErrors
