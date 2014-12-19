gulp = require('gulp')

gulp.task 'watch',['setWatch','browserSync'],->
  gulp.watch 'src/**/*.coffee', ['browserify' ]
  gulp.watch 'src/**/*.jade', ['jade','browserify']
  gulp.watch 'src/**/*.scss', ['sass']
