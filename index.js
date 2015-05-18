var util  = require('util');
var exec  = require('child_process').exec;
var glob  = require('glob');
var path  = require('path');
var async = require('async');

require('coffee-script/register');
require('rootpath')();

module.exports = require('./src/generate')(util, exec, glob, path, async);
