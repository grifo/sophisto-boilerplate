flour = require 'flour'
path = require 'path'

# disable minify in bundle
# flour.minifiers['.js'] = (file, cb) -> cb file.buffer


task 'build:scripts', ->
    bundle [
        'source/scripts/backbone.js'
    ], 'public/js/main.js'

task 'build:stylus', ->
    compile 'source/stylus/main.styl', 'public/styles/main.css'


task 'build', ->
    invoke 'build:scripts'
    invoke 'build:stylus'


task 'watch', ->
    invoke 'build'

    watch 'source/coffee/*.coffee', -> invoke 'build:scripts'
    watch 'source/stylus/*.styl', -> invoke 'build:stylus'