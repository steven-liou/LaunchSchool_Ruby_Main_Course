require "socket"

server = TCPServer.new("localhost", 3003)

def parse_request(request_line)
  method, path_params, protocol = request_line.split
  path, params = path_params.split('?')

  params = params.split('&').each_with_object({}) do |pair, hash|
    name, value = pair.split('=')
    hash[name] = value.to_i
  end
  [method, path, params, protocol]
end

loop do
  client = server.accept

  request_line = client.gets
  puts request_line

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

  client.puts "<h2>Rolls!</h2>"
  params["rolls"].times do
    client.puts "<p>", rand(1..params["sides"]), "</p>"
  end

  client.puts "</body>"
  client.puts "</html>"

  client.close
end
