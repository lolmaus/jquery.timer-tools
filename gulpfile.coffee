gulp     = require 'gulp'
coffee   = require 'gulp-coffee'
gutil    = require 'gulp-util'
uglify   = require 'gulp-uglify'
rename   = require 'gulp-rename'

gulp.task 'default', ->
  gulp.src ['./*.coffee', '!./node_modules/**', '!./gulpfile.coffee']
  
    .pipe coffee()
    .on 'error', gutil.log
    
    .pipe uglify preserveComments: 'some'
    
    .pipe rename suffix: ".min"
    
    .pipe gulp.dest('.')