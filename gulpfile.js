var gulp = require("gulp")
  , gzip = require('gulp-gzip')
  , util = require('gulp-util')
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
  , coffee = require('gulp-coffee')
    , nodemon = require('gulp-nodemon')
    ,refresh = require('gulp-refresh')
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

gulp.task('coffees', function() {
  gulp.src('./coffee/*.coffee')
    .pipe(coffee({bare: true}).on('error', util.log))
    .pipe(gulp.dest('./js/'));
});

gulp.task('watch', ['less','coffees'], function () {
  var watcher = gulp.watch('./less/**/*.less', ['less']);
  var watcher = gulp.watch('./coffee/**/*.coffee', ['coffees']);
});

gulp.task('nodemon', function runNodemon(cb) {
    var started = false;
    return nodemon({
        script: 'js/app.js',
        watch : ['js/'],
        ext : "js"
    }).on('start', function start() {
        // to avoid nodemon being started multiple times
        if (!started) {
            cb();
            started = true;
        }
    }).on('restart', function () {
            setTimeout(refresh.reload,1000)
    });
});

gulp.task('start', ['less','coffees','nodemon']);