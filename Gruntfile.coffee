###
grunt-auto-config
https://github.com/marutk/grunt-auto-config

Copyright (c) 2014 Marut K
Licensed under the MIT license.
###

'use strict'

module.exports = (grunt)->

  # Project configuration.
  grunt.initConfig(

    # Before generating any new files, remove any previously-created files.
    clean:
      tests: ['tmp']

    # Configuration to be run (and then tested).
    auto_config:
      options:
        dir: './config'
  )

  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask 'test', ['clean', 'auto_config', 'nodeunit']

  # By default, lint and run all tests.
  grunt.registerTask 'default', ['coffeelint', 'test']

  # Actually load this plugin's task(s).
  grunt.loadTasks 'tasks'
