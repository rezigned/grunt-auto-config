module.exports =
  options:
    jshintrc: '.jshintrc'
    max_line_length:
      value: 128

  all: [
    'Gruntfile.coffee'
    'tasks/*.coffee'
    '<%= nodeunit.tests %>'
  ]
