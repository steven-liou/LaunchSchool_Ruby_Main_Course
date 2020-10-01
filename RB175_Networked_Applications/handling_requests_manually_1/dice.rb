require 'socket'

def parse_request(string)
  method, path_params, protocol = string.split
  path, params = path_params.split('?')
  params = params.split('&').each_with_object({}) do |pair, result|
    name, value = pair.split('=')
    result[name] = value
  end
  [method, path, params, protocol]
end

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  puts request_line
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"

  http_method, path, params, protocol = parse_request(request_line)
  
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts request_line
  client.puts "Method: #{http_method}"
  client.puts "Path: #{path}"
  client.puts "protocol: #{protocol}"
  client.puts "Parameters: #{params}"
  client.puts "</pre>"

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i
  
  client.puts "<h2>Rolls!</h2>" 
  rolls.times do |index|
    client.puts "<p>Roll #{index + 1}: #{rand(sides) + 1}</p>" 
  end
  client.puts "</body>"
  client.puts "</html>"

  client.close
end


  
