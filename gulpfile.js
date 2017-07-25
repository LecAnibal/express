var gulp = require("gulp")
  , gzip = require('gulp-gzip')
  , webpack = require('webpack-stream')
  , rename = require('gulp-rename')
  , filter = require('gulp-filter')
  , less = require('gulp-less')
  , path = require('path')
  , combiner = require('stream-combiner2')
  , cssnano = require('gulp-cssnano')
  , lessAutoprefix = require('less-plugin-autoprefix')
  , exec = require('child_process').exec
  , named = require('vinyl-named')
  ;

var autoprefix = new lessAutoprefix({ browsers: ['last 2 versions'] });


 gulp.task('less', function () {

  var combined = combiner.obj([
    gulp.src(['./less/**/*.less', '!**/_*', '!**/_*/**/*.less'])
    .pipe(less({
      paths: [ path.join(__dirname, 'src','less', '_common')],
      plugins: [autoprefix]
    }))
    .pipe(cssnano({
      zindex: false,
      discardComments: { removeAll: true },
      removeEmpty: true,
      discardDuplicates: true
    }))
    .pipe(gulp.dest('./css/'))
    .pipe(gulp.dest('./css/'))
  ]);

  combined.on('error', console.error.bind(console));
  return combined;

});

gulp.task('watch', ['less'], function () {
  var watcher = gulp.watch('./less/**/*.less', ['less']);
});