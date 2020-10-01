require 'rack'
require_relative 'rack_logger'

app = proc do
  [200, {}, ['Hello']]
end

use RackLogger
run app
