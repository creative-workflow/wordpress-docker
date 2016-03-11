require('coffee-script/register');

gulp = require('gulp');

require('require-dir')("gulp/", {recurse: true});

gulp.task('default', ['serve']);
