$LOAD_PATH.unshift(File.dirname(__FILE__))


require 'httparty'
require 'deadlinez/api'
require 'deadlinez/proxy'

module Deadlinez
  class << self
    attr_accessor :api_key # deprecated, not needed.
  end
end
