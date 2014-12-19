gulp = require 'gulp'
#copy = require 'gulp-copy'
gutil = require('gulp-util')

#gulp.task 'copy', ->
#  gulp.src './node_modules/bootstrap/dist/css/bootstrap.min.css'
#  .pipe(copy('dist/',{prefix:0}))
#  .on 'error', gutil.log

gulp.task 'copy', ['fonts'],->
  gulp.src './node_modules/bootstrap/dist/css/bootstrap.min.css'
  .pipe gulp.dest 'dist/css'
#  .pipe(copy('dist/',{prefix:0}))
#  .on 'error', gutil.log
