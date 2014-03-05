###
grunt-auto-config
https://github.com/rezigned/grunt-auto-config

Copyright (c) 2013 Marut K
Licensed under the MIT license.
###


path = require 'path'

module.exports = (grunt)->

  pkg = require path.resolve 'package.json'
  npm = path.resolve 'node_modules'
  _   = grunt.util._

  # automatically load all npm tasks
  for task of pkg.devDependencies

    # ignore npm module that does not have ./tasks dir
    taskDir = path.join npm, task, 'tasks'

    if !grunt.file.isDir taskDir or task is 'grunt-auto-config'
      continue

    grunt.verbose.writeln().write "grunt-auto-config: Loading #{task}"
    grunt.loadNpmTasks task

  # merge options
  options = _.extend {
    dir: './config'
    exts: 'js,coffee'
  }, grunt.config 'auto_config.options'

  if !grunt.file.isDir options.dir
    grunt.fatal "Invalid config directory #{options.dir}"

  # find config file for each task
  # grunt.file.findup('Gruntfile.{js,coffee}', {nocase: true})
  findConfig = (taskName, options)->
    files = grunt.file.glob.sync "#{taskName}.{#{options.exts}}",
      cwd: options.dir
      maxDepth: 1

    files.pop() || null

  # load grunt configs
  registeredTasks = grunt.task._tasks

  # load all task configs
  for taskName of registeredTasks
    if file = findConfig taskName, options
      config = _.clone require path.resolve(path.join options.dir, taskName)

      # default configs can be overriden by config in Gruntfile
      config = _.extend config || {}, grunt.config taskName
      grunt.config taskName, config

  grunt.registerTask 'auto_config', 'Automatically load grunt configs', ()->
    # do nothing