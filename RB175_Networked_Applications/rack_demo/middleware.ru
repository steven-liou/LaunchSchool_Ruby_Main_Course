class MyMiddlewares
  def initialize(app)
    @app = app
  end
end

class MiddlewareTwo
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "MiddlewareTwo Reporting in!"
    puts "The app is #{@app}"
    puts "The app has the method #{@app.methods - Object.methods}"
    status, headers, body = @app.call(env)
    [status, headers, body]
  end
end

class MiddlewareOne
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "MiddlewareOne Reporting in!"
    puts "The app is #{@app}"
    puts "The app has the methods: #{@apps.methods - Object.methods}"
    status, headers, body = @app.call(env)
    [status, headers, body]
  end
end

class HandlerClass
  def self.call(_env)
    puts "Handling the request..."
    [200, { "Content-Type" => "text/html" }, ["<b>Request handled.</b>"]]
  end
end

use MiddlewareTwo
use MiddlewareOne
run HandlerClass
