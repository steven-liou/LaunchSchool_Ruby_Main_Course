require "socket"

def parse_request(request_line)
  method, path_params, protocol = request_line.split(" ")
  path, params = path_params.split('?')

  params = (params || "").split("&").each_with_object({}) do |pair, hash|
    name, value = pair.split('=')
    hash[name] = value.to_i
  end
  [method, path, params, protocol]
end

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept

  request_line = client.gets
  puts request_line
  next unless request_line || !request_line =~ "favicon"
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"

  method, path, params, protocol = parse_request(request_line)
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts method
  client.puts path
  client.puts protocol
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"

  client.puts %(<a href="?number=#{number - 1}">Subtract one</a>)
  client.puts %(<a href="?number=#{number + 1}">Add one</a>)

  client.puts "</body>"
  client.puts "</html>"

  client.close
end
