gulp = require 'gulp'
riot = require 'gulp-riot'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'

gulp.task 'riot', ->
  gulp.src 'app/tags/**/*.tag'
    .pipe riot()
    .pipe(concat('email-tags.js'))
    .pipe gulp.dest 'js/'

gulp.task 'coffee', ->
  gulp.src 'app/scripts/**/*.coffee'
    .pipe coffee()
    .pipe(concat('app.js'))
    .pipe gulp.dest 'js/'

gulp.task 'watch', ->
  gulp.watch 'app/tags/**/*.tag', ['riot']
