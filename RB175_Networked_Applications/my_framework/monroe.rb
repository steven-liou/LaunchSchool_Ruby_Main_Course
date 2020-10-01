class Monroe
  def response(status, headers, body='')
    body = yield if block_given?
    [status, headers, [body]]
  end

  def erb(file, local= {})
    b = binding
    message = local[:message]
    template = File.read("views/#{file}.erb")
    ERB.new(template).result(b)
  end
end
