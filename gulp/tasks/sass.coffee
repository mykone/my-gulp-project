gulp = require('gulp')
sass = require('gulp-sass')
handleErrors = require('../util/handleErrors')
browserSync  = require('browser-sync')

gulp.task 'sass', ->
  gulp.src 'src/**/*.scss'
  .pipe sass()
  .pipe gulp.dest 'dist/'
  .on 'error', handleErrors
  .pipe(browserSync.reload({stream:true}));
