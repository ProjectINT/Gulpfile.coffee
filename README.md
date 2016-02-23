# Gulpfile.coffee
Gulpfile for Node.js Express boilerplate with jade, coffeescript, stylus, browserify, browsersync, and other. 

I'am create this repo for learning gulp.js, github and create good boilerplate with my favorite technologies.

You must have already instaled node.js, express, nodemon, then:

### express myapp

### cd myapp
### npm i

Will work with gulp#4

### npm -i gulpjs/gulp#4.0 -g
### npm -i gulpjs/gulp#4.0 --save-dev

### npm install -g coffee-script
### npm install -g stylus
### npm install -g js2coffee
### npm install -g browser-sync

### npm i gulp-coffee gulp-util gulp-plumber gulp-stylus gulp-debug gulp-nodemon gulp-js2coffee
browser-sync --save-dev

copy gulpfile.coffee to myapp

To compile js files to coffee:
### gulp require coffee-script/register j2c 
### or add aliace to bash: alias gulp='gulp --require coffee-script/register' and type
### gulp j2c

Now you have coffee files near js files

Do not shure that its right, but i change options "bare" to true in file node_modules/gulp-coffee/index.js to disable wrap function after coffee-script compiling.

To build and start project type:
### gulp
