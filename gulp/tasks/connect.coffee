gulp = require 'gulp'
connect = require 'gulp-connect'
open = require 'gulp-open'

gulp.task('connect', ->
  connect.server(
    port: 8000,
    root: 'dist',
    livereload: true
  )
)