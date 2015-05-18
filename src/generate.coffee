module.exports = (util, exec, glob, path, async) ->

  generate: (options = {}, callback) ->

    options.source_path = options.source_path || process.cwd()
    options.source_extension = options.source_extension || 'txt'
    options.images_path = options.images_path || process.cwd()


    async.parallel
      mermaid: (callback) ->
        path_command_mermaid = 'find . | grep /.bin/mermaid'
        exec path_command_mermaid, (error, stdout, stderr) ->
          cmd = (stdout || '').split('\n')[0]
          if cmd is ''
            return callback('could not find .bin/mermaid')
          else
            return callback(stderr, cmd)
      phantonjs: (callback) ->
        path_command_phanton = 'find . | grep /.bin/phantomjs'
        exec path_command_phanton, (error, stdout, stderr) ->
          cmd = (stdout || '').split('\n')[0]
          if cmd is ''
            return callback('could not find .bin/phantomjs')
          else
            return callback(stderr, cmd)
    , (err, commands) ->
      if err
        console.error err
        return callback(err)

      files = []
      glob.sync("*.#{options.source_extension}",
        cwd: options.source_path
      ).forEach (option) ->
        files.push path.join(options.source_path, option)

      async.each files, (file, callback) ->
        command = util.format("%s --png --verbose --phantomPath %s --outputDir %s %s", commands.mermaid, commands.phantonjs, options.images_path, file)

        exec command, (error, stdout, stderr) ->
          callback(stderr)

      , (err) ->
        if err
          console.error err
        return callback(err)
