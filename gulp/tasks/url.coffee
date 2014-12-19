gulp = require('gulp')
open = require('gulp-open')

gulp.task "url", ->
  options =
    url: "http://localhost:3000"
    app: "firefox"

  gulp.src("./../dist/index.html").pipe open("", options)
  return