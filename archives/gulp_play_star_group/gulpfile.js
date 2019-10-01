//http://blog.rangle.io/angular-gulp-bestpractices/
//http://macr.ae/article/splitting-gulpfile-multiple-files.html
//https://css-tricks.com/gulp-for-beginners/

/**
	@note ...
*/

var
  gulp = require('gulp'),
		//gulp.task('default', function() {
		//  // place code for your default task here
		//})
  runSequence = require('run-sequence'),
	shell = require('gulp-shell')
		//gulp.task('shorthand', shell.task([
		//  'echo hello',
		//  'echo world'
		//]))  
  //todo--compile build

require('require-dir')('./bin'); 

gulp.task('default', function() {
  runSequence(['test', 'test2'])
  //console.log("default task")
})