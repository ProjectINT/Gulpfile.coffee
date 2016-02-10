gulp = require 'gulp'
coffee = require 'gulp-coffee'
js2coffee = require 'gulp-js2coffee'
fs = require 'fs'
gutil = require 'gulp-util'
plumber = require 'gulp-plumber'
stylus = require 'gulp-stylus'
debug = require 'gulp-debug'


gulp.task 'default', ['coffee', 'styles']

gulp.task 'coffee', ->
  gulp.src ['./routes/**/*.js', './models/**/*/js', './public/**/*.js']
  .pipe debug({title: 'src'})
  .pipe do coffee
  .pipe do plumber
  	.on 'error', gutil.log
  .pipe gulp.dest (file)-> file.base
  return

gulp.task 'j2c', ->
  gulp.src ['./routes/**/*.js', './models/**/*/js', './public/**/*.js']
  .pipe debug({title: 'src'})
  .pipe do plumber
  .pipe do js2coffee
  	.on 'error', err = -> 	return console.log(err)
  .pipe gulp.dest (file)-> file.base

gulp.task 'styles', ->
	gulp.src ['./public/stylesheets/*.styl']
	.pipe debug({title: 'src'})
	.pipe do plumber
	.pipe do stylus
	.pipe gulp.dest (file)-> file.base
