// Generated by CoffeeScript 2.0.0-beta8
var addHistory, addMultilineHandler, CoffeeScript, CS, fs, merge, nodeREPL, path, vm;
fs = require('fs');
path = require('path');
vm = require('vm');
nodeREPL = require('repl');
CoffeeScript = require('./module');
CS = require('./nodes');
merge = require('./helpers').merge;
addMultilineHandler = function (repl) {
  var buffer, cache$, continuationPrompt, enabled, initialPrompt, inputStream, nodeLineListener, outputStream, rli;
  cache$ = repl;
  rli = cache$.rli;
  inputStream = cache$.inputStream;
  outputStream = cache$.outputStream;
  initialPrompt = repl.prompt.replace(/^[^> ]*/, function (x) {
    return x.replace(/./g, '-');
  });
  continuationPrompt = repl.prompt.replace(/^[^> ]*>?/, function (x) {
    return x.replace(/./g, '.');
  });
  enabled = false;
  buffer = '';
  nodeLineListener = rli.listeners('line')[0];
  rli.removeListener('line', nodeLineListener);
  rli.on('line', function (cmd) {
    if (enabled) {
      buffer += '' + cmd + '\n';
      rli.setPrompt(continuationPrompt);
      rli.prompt(true);
    } else {
      nodeLineListener(cmd);
    }
  });
  return inputStream.on('keypress', function (char, key) {
    if (!(key && key.ctrl && !key.meta && !key.shift && key.name === 'v'))
      return;
    if (enabled) {
      if (!buffer.match(/\n/)) {
        enabled = !enabled;
        rli.setPrompt(repl.prompt);
        rli.prompt(true);
        return;
      }
      if (null != rli.line && !rli.line.match(/^\s*$/))
        return;
      enabled = !enabled;
      rli.line = '';
      rli.cursor = 0;
      rli.output.cursorTo(0);
      rli.output.clearLine(1);
      buffer = buffer.replace(/\n/g, '\uff00');
      rli.emit('line', buffer);
      buffer = '';
    } else {
      enabled = !enabled;
      rli.setPrompt(initialPrompt);
      rli.prompt(true);
    }
  });
};
addHistory = function (repl, filename, maxSize) {
  var buffer, e, fd, lastLine, original_clear, readFd, size, stat;
  try {
    stat = fs.statSync(filename);
    size = Math.min(maxSize, stat.size);
    readFd = fs.openSync(filename, 'r');
    buffer = new Buffer(size);
    if (size)
      fs.readSync(readFd, buffer, 0, size, stat.size - size);
    repl.rli.history = buffer.toString().split('\n').reverse();
    if (stat.size > maxSize)
      repl.rli.history.pop();
    if (repl.rli.history[0] === '')
      repl.rli.history.shift();
    repl.rli.historyIndex = -1;
  } catch (e$) {
    e = e$;
    repl.rli.history = [];
  }
  fd = fs.openSync(filename, 'a');
  lastLine = repl.rli.history[0];
  repl.rli.addListener('line', function (code) {
    if (code && code !== lastLine) {
      lastLine = code;
      return fs.writeSync(fd, '' + code + '\n');
    }
  });
  repl.rli.on('exit', function () {
    return fs.closeSync(fd);
  });
  original_clear = repl.commands['.clear'].action;
  repl.commands['.clear'].action = function () {
    repl.outputStream.write('Clearing history...\n');
    repl.rli.history = [];
    fs.closeSync(fd);
    fd = fs.openSync(filename, 'w');
    lastLine = void 0;
    return original_clear.call(this);
  };
  return repl.commands['.history'] = {
    help: 'Show command history',
    action: function () {
      repl.outputStream.write('' + repl.rli.history.slice().reverse().join('\n') + '\n');
      return repl.displayPrompt();
    }
  };
};
module.exports = {
  start: function (opts) {
    var repl;
    if (null == opts)
      opts = {};
    opts.prompt || (opts.prompt = 'coffee> ');
    if (null != opts.ignoreUndefined)
      opts.ignoreUndefined;
    else
      opts.ignoreUndefined = true;
    if (null != opts.historyFile)
      opts.historyFile;
    else
      opts.historyFile = path.join(process.env.HOME, '.coffee_history');
    if (null != opts.historyMaxInputSize)
      opts.historyMaxInputSize;
    else
      opts.historyMaxInputSize = 10 * 1024;
    opts['eval'] || (opts['eval'] = function (input, context, filename, cb) {
      var err, inputAst, js, jsAst, transformedAst;
      input = input.replace(/\uFF00/g, '\n');
      input = input.replace(/^\(([\s\S]*)\n\)$/m, '$1');
      input = input.replace(/(^|[\r\n]+)(\s*)##?(?:[^#\r\n][^\r\n]*|)($|[\r\n])/, '$1$2$3');
      if (/^\s*$/.test(input))
        return cb(null);
      try {
        inputAst = CoffeeScript.parse(input, {
          filename: filename,
          raw: true
        });
        transformedAst = new CS.AssignOp(new CS.Identifier('_'), inputAst.body);
        jsAst = CoffeeScript.compile(transformedAst, {
          bare: true,
          inScope: Object.keys(context)
        });
        js = CoffeeScript.js(jsAst);
        return cb(null, vm.runInContext(js, context, filename));
      } catch (e$) {
        err = e$;
        return cb('\x1b[0;31m' + err.constructor.name + ': ' + err.message + '\x1b[0m');
      }
    });
    repl = nodeREPL.start(opts);
    repl.on('exit', function () {
      return repl.outputStream.write('\n');
    });
    addMultilineHandler(repl);
    if (opts.historyFile)
      addHistory(repl, opts.historyFile, opts.historyMaxInputSize);
    return repl;
  }
};
