$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'deadlinez'
require 'spec'
require 'spec/autorun'

require 'fakeweb'
FakeWeb.allow_net_connect = false

def fixture_path(file)
  File.dirname(__FILE__) + "/fixtures/#{file}"
end

def fixture_for(file)
  File.read(fixture_path(file))
end

Spec::Runner.configure do |config|
end
