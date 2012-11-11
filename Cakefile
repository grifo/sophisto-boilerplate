flour = require 'flour'
ender = require 'ender'

task 'build:scripts', ->
    bundle [
        'source/scripts/ender.min.js'
        'source/coffee/main.coffee'
    ], 'public/scripts/main.js'


task 'build:stylus', ->
    compile 'source/stylus/main.styl', 'public/styles/main.css'


task 'build', ->
    # https://github.com/ender-js/Ender/wiki/Ender-package-list
    ender.build [
        'bonzo'     # DOM utility
        'bean'      # event manager
        'domready'  # DOM ready
    ], output: 'source/scripts/ender', -> 
        invoke 'build:scripts'

    invoke 'build:stylus'


task 'watch', ->
    # disable the JS minifier during development
    flour.minifiers.js = null

    invoke 'build'

    watch 'source/coffee/*.coffee', -> 
        invoke 'build:scripts'

    watch 'source/scripts/*.js', -> 
        invoke 'build:scripts'

    watch 'source/stylus/*.styl', -> 
        invoke 'build:stylus'