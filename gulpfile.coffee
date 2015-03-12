gulp = require 'gulp'
riot = require 'gulp-riot'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'
jade = require 'gulp-jade'

gulp.task 'presentation', ->
  gulp.src 'presentation/app/index.jade'
    .pipe jade()
    .pipe gulp.dest 'presentation/'

gulp.task 'riot', ->
  gulp.src 'riot/app/tags/**/*.tag'
    .pipe riot()
    .pipe(concat('riot/email-tags.js'))
    .pipe gulp.dest 'js/'

gulp.task 'coffee', ->
  gulp.src 'riot/app/scripts/**/*.coffee'
    .pipe coffee()
    .pipe(concat('app.js'))
    .pipe gulp.dest 'js/'

gulp.task 'riotwatch', ->
  gulp.watch 'riot/app/tags/**/*.tag', ['riot']

gulp.task 'pres', ->
  gulp.watch 'presentation/app/**/*.jade', ['presentation']
