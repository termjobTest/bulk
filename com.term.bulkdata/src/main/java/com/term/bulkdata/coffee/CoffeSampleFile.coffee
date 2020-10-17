Fs           = require "fs"
Path         = require "path"
UglifyJS     = require "uglify-js"
CoffeeScript = require "coffee-script"



# Express.js middleware to render coffee-script. Using that middleware your
# client can request .js files, that will be mapped to .coffee files. Doing so
# it is possible to write coffee-script files and sending them compiled as .js
# files back to the client.
exports.create = (App) ->
  return App.emit "error", "coffeeScriptMiddleware", "create", "coffee-script source path missing" if !App.config.coffeeScriptMiddleware.path



  coffeeScriptMiddleware       = {}
  coffeeScriptMiddleware.cache = hits: {}, misses: []



  coffeeScriptMiddleware.middleware = (req, res, nextCb) ->
    coffeeScriptMiddleware.startTiming = Date.now()

    # prevent memory leaks by too many cached "misses" indizes
    coffeeScriptMiddleware.cache.misses.shift() if coffeeScriptMiddleware.cache.misses.length > 100
    # skip middleware if we know, there is no .coffee file to render
    return nextCb() if req.url in coffeeScriptMiddleware.cache.misses
    # respond a cached version, if we have one
    return coffeeScriptMiddleware.send req.url, res, coffeeScriptMiddleware.cache.hits[req.url] if coffeeScriptMiddleware.cache.hits[req.url]
    # try to render a .coffee file
    return coffeeScriptMiddleware.render req.url, res, nextCb if req.url.match /\.js$/
    # calling next middleware
    nextCb()



  coffeeScriptMiddleware.render = (reqUrl, res, nextCb) ->
    filePath = Path.join App.config.coffeeScriptMiddleware.path, reqUrl.replace(".js", ".coffee")
    Fs.readFile filePath, "utf8", (err, coffeeScript) =>
      if err
        coffeeScriptMiddleware.cache.misses.push reqUrl
        App.emit "debug", "coffeeScriptMiddleware", "render", { file: Path.basename(reqUrl), err: err }
        return nextCb()

      try
        # Compile coffee-script to java-script.
        javaScript = CoffeeScript.compile coffeeScript, { bare: App.config.coffeeScriptMiddleware.bare }

        # Compress java-script.
        if App.config.coffeeScriptMiddleware.compress == true
          javaScript = UglifyJS.minify(javaScript, { fromString: true }).code

      catch err
        return App.emit "error", "coffeeScriptMiddleware", "render", { file: Path.basename(reqUrl), err: err }

      coffeeScriptMiddleware.cache.hits[reqUrl] = javaScript
      coffeeScriptMiddleware.send reqUrl, res, javaScript



  coffeeScriptMiddleware.send = (reqUrl, res, js) ->
    res.setHeader "Content-Type", "text/javascript"
    res.setHeader "Content-Length", Buffer.byteLength(js)
    res.end js
    App.emit "debug", "coffeeScriptMiddleware", "render", { file: Path.basename(reqUrl), time: Date.now() - coffeeScriptMiddleware.startTiming }

coffeeScriptMiddleware.send = (reqUrl, res, js) ->
    res.setHeader "Content-Type", "text/javascript"
    res.setHeader "Content-Length", Buffer.byteLength(js)
    res.end js
    App.emit "debug", "coffeeScriptMiddleware", "render", { file: Path.basename(reqUrl), time: Date.now() - coffeeScriptMiddleware.startTiming }

coffeeScriptMiddleware.send = (reqUrl, res, js) ->
    res.setHeader "Content-Type", "text/javascript"
    res.setHeader "Content-Length", Buffer.byteLength(js)
    res.end js
    App.emit "debug", "coffeeScriptMiddleware", "render", { file: Path.basename(reqUrl), time: Date.now() - coffeeScriptMiddleware.startTiming }

coffeeScriptMiddleware.send = (reqUrl, res, js) ->
    res.setHeader "Content-Type", "text/javascript"
    res.setHeader "Content-Length", Buffer.byteLength(js)
    res.end js
    App.emit "debug", "coffeeScriptMiddleware", "render", { file: Path.basename(reqUrl), time: Date.now() - coffeeScriptMiddleware.startTiming }

coffeeScriptMiddleware.send = (reqUrl, res, js) ->
    res.setHeader "Content-Type", "text/javascript"
    res.setHeader "Content-Length", Buffer.byteLength(js)
    res.end js
    App.emit "debug", "coffeeScriptMiddleware", "render", { file: Path.basename(reqUrl), time: Date.now() - coffeeScriptMiddleware.startTiming }

coffeeScriptMiddleware.send = (reqUrl, res, js) ->
    res.setHeader "Content-Type", "text/javascript"
    res.setHeader "Content-Length", Buffer.byteLength(js)
    res.end js
    App.emit "debug", "coffeeScriptMiddleware", "render", { file: Path.basename(reqUrl), time: Date.now() - coffeeScriptMiddleware.startTiming }



  coffeeScriptMiddleware