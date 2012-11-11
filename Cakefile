flour = require 'flour'
ender = require 'ender'


task 'deploy', (opts) ->
    require('child_process').exec """
        git branch -D gh-pages
        git checkout -b gh-pages
        mv public deploy
        git rm -rf .
        mv deploy/* .
        rm -rf node_modules deploy
        git add .
        git commit -m "deploy"
        git push origin gh-pages
        git checkout master
    """, (error, stdout, stderr) -> 
        console.log stdout

task 'dev', ->
    # disable the js minifier
    flour.minifiers.js = null


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
    invoke 'build'

    watch 'source/coffee/*.coffee', -> 
        invoke 'build:scripts'

    watch 'source/scripts/*.js', -> 
        invoke 'build:scripts'

    watch 'source/stylus/*.styl', -> 
        invoke 'build:stylus'