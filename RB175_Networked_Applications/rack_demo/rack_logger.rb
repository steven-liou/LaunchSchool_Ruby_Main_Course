class RackLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    puts[Time.now.to_i, env['REQUEST_METHOD'], env['REQUEST_PATH'], env['QUERY_STRING']].join(',')
    @app.call(env)
  end
end
