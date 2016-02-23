gulp         = require 'gulp'
coffee       = require 'gulp-coffee'
gutil        = require 'gulp-util'
plumber      = require 'gulp-plumber'
stylus       = require 'gulp-stylus'
debug        = require 'gulp-debug'
nodemon      = require 'gulp-nodemon'
js2coffee    = require 'gulp-js2coffee'
browserSync  = require 'browser-sync'


gulp.task 'j2c', ->
  gulp.src ['./public/**/*.js', './*.js', 'models/**/*.js', './routes/**/*.js']
  .pipe do plumber
  .pipe js2coffee()
  .on('error', gutil.log)
  .pipe gulp.dest (file)-> file.base
  
gulp.task 'coffee', ->
  gulp.src ['./public/**/*.coffee', './app.coffee']
  .pipe debug({title: 'src'})
  .pipe do coffee
  .pipe debug({title: 'coffee'})
  .pipe do plumber
  .on 'error', gutil.log
  .pipe gulp.dest (file)-> file.base
  
gulp.task 'styles', ->
  gulp.src ['./public/stylesheets/*.styl']
  .pipe do plumber 
  .pipe debug({title: 'src'})
  .pipe do stylus
  .pipe debug({title: 'stylus'})
  .pipe autoprefixer
    browsers: [ 'last 2 versions' ]
    cascade: false
  .pipe gulp.dest (file)-> file.base
  

gulp.task 'browserSync', ->
  browserSync.init
    files: ['public/**/*.*', './app.coffee'] 
    proxy: 'http://localhost:3000'   
    port: 4000  
    open: false
  
gulp.task 'nodemon', ->
  nodemon
    script: './bin/www'
    ext: 'js jade css'
    ignore: 'node_modules/**/*', 'bin/**/*', 'test/**/*'

gulp.task 'default', gulp.series(gulp.parallel('coffee', 'styles'), gulp.parallel('browserSync', 'nodemon'))
