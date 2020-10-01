require 'rack'

handler = Rack::Handler::WEBrick

class RackApp
  def call(env)
    req = Rack::Request.new(env)

    [200, { 'Content-Type' => 'text/plain' }, ['Hello from Rack']]
  end
end

class FilterLocalHost
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)

    if req.ip == "127.0.0.1" || req.ip == "::1"
      [403, {}, [""]]
    else
      @app.call(env)
    end
  end
end

app = Rack::Builder.new do |builder|
  builder.use FilterLocalHost
  builder.run RackApp.new
end

handler.run RackApp.new
