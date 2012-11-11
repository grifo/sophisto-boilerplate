flour = require 'flour'


task 'dev', ->
    # disable the js minifier
    flour.minifiers.js = null
    flour.compilers.styl.compress = false


task 'build:scripts', ->
    bundle [
        'source/scripts/ender.min.js'
        'source/coffee/main.coffee'
    ], 'public/scripts/main.js'


task 'build:styles', ->
    compile 'source/stylus/main.styl', 'public/styles/main.css'


task 'build', ->
    # https://github.com/ender-js/Ender/wiki/Ender-package-list
    (require 'ender').build [
        'bonzo'     # DOM utility
        'bean'      # event manager
        'domready'  # DOM ready
    ], output: 'source/scripts/ender', -> 
        invoke 'build:scripts'

    invoke 'build:styles'


task 'watch', ->
    invoke 'build'

    watch 'source/coffee/*.coffee', -> 
        invoke 'build:scripts'

    watch 'source/scripts/*.js', -> 
        invoke 'build:scripts'

    watch 'source/stylus/*.styl', -> 
        invoke 'build:styles'