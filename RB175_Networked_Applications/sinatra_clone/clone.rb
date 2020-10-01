def handle_request; end

def get(path)
  puts "[Fake] registering new route: GET #{path}"
  loop do
    handle_request
  end
end

### end fake sinatra

get '/frank-says' do
  "Put this in your pipe & smoke it!"
end

get '/time' do
  Time.now.to_s
end
