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
    
gulp.task('test', function() {
  console.log("default ~ test")
})

gulp.task('test2', function() {
  console.log("default ~ test2")
})