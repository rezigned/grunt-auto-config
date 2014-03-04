# grunt-auto-config

> Automatically load all grunt plugins and their configs in a nicer way

[![Build Status](https://travis-ci.org/rezigned/grunt-auto-config.png)](https://travis-ci.org/rezigned/grunt-auto-config)

## Getting Started
> This plugin requires Grunt `~0.4.1`. 

In a nutshell, this plugin will load all your grunt plugins automatically by reading it from `package.json` file. So, you don't have to explicitly set `grunt.loadNpmTasks();` in your Gruntfile anymore.

Another thing that `grunt-auto-config` offers you is a better grunt configs structure. Instead of having a long configuration in `Gruntfile`. It'll also lookup for config in `./config` directory for each task.

For example, let's say you have `grunt-contrib-copy` plugin installed. Normally you'll have to put its config in Gruntfile like this

```js
grunt.initConfig({
  copy: { ... }
})
```

With this plugin, it'll look for file `./config/copy.js` (or `copy.coffee`) and load from that file. So, in `copy.js` you just have to add this.

```
module.exports = {
  options: ...
  target1: ...
}
```

You may install this plugin with this command:

```shell
npm install grunt-auto-config --save-dev
```

To enable this plugin, put this line of code at the end of Gruntfile:

```js
// other stuffs
grunt.loadNpmTasks('grunt-auto-config');
```

## The "auto_config" task

### Overview
In your project's Gruntfile, add a section named `auto_config` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  auto_config: {
    options: {
      // Task-specific options go here.
    }
  },
});
```

### Options

#### options.dir
Type: `String`
Default value: `./config`

A string value that is used to specify grunt config directory

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
_(Nothing yet)_
