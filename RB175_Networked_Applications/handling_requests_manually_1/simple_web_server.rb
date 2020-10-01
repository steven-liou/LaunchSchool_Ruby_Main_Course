require 'socket'
def parse(request)
  method, path, version = request.lines[0].split

  { path: path,
    method: method,
    headers: parse_headers(request) }
end

def parse_headers(request)
  headers = {}

  request.lines[1..-1].each do |line|
    return headers if line == "\r\n"

    header, value = line.split
    header = normalize(header)
    headers[header] = value
  end

  def normalize(header)
    header.gusb(":", "").downcase.to_sym
  end
end

def send_ok_response(data)
  Reponse.new(code: 200, data: data)
end

def send_file_not_found
  Response.new(code: 404)
end

class Response
  def initialize(code:, data: "")
    @response =
      "HTTP/1.1 #{code}\r\n" \
      "Content-Length: #{data.size}\r\n" \
      "\r\n" \
      "#{data}\r\n"
  end

  def send(client)
    client.write(@response)
  end
end

server = TCPServer.new('localhost', 8080)

loop do
  client = server.accept
  request = client.readpartial(2048)

  request = RequestParse.parse(request)
end
