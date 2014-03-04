'use strict'

grunt = require 'grunt'

###
  ======== A Handy Little Nodeunit Reference ========
  https://github.com/caolan/nodeunit

  Test methods:
    test.expect(numAssertions)
    test.done()
  Test assertions:
    test.ok(value, [message])
    test.equal(actual, expected, [message])
    test.notEqual(actual, expected, [message])
    test.deepEqual(actual, expected, [message])
    test.notDeepEqual(actual, expected, [message])
    test.strictEqual(actual, expected, [message])
    test.notStrictEqual(actual, expected, [message])
    test.throws(block, [error], [message])
    test.doesNotThrow(block, [error], [message])
    test.ifError(value)
###

exports.auto_config =
  setUp: (done) ->
    
    # setup here if necessary
    done()
    return

  default_options: (test) ->
    test.expect 1

    expected = require './expected/nodeunit.coffee'
    actual   = grunt.config 'nodeunit'

    test.deepEqual actual, expected
    test.done()

  custom_options: (test) ->
    test.expect 1

    expected = require './expected/clean.coffee'
    actual   = grunt.config 'clean'

    test.deepEqual actual, expected
    test.done()
