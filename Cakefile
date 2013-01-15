flour = require 'flour'


task 'dev', ->
    # disable the js minifier
    flour.minifiers.js = null
    flour.compilers.styl.compress = false


task 'build:scripts', ->
    bundle [
        'source/scripts/rye-0.0.1.js'
        'source/scripts/main.coffee'
    ], 'public/scripts/main.js'


task 'build:styles', ->
    bundle [
        'source/styles/reset.css'
        'source/styles/main.styl'
        'source/styles/print.css'
    ], 'public/styles/main.css'

task 'build', ->
    invoke 'build:scripts'
    invoke 'build:styles'


task 'watch', ->
    invoke 'build'

    watch 'source/scripts/', -> 
        invoke 'build:scripts'

    watch 'source/styles/', -> 
        invoke 'build:styles'