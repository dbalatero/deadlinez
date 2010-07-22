module Deadlinez
  class Api
    include HTTParty
    format :xml
    base_uri 'service.afterthedeadline.com'

    REQUIRED_HEADERS = {
      'Host' => 'service.afterthedeadline.com',
      'Content-Type' => 'application/x-www-form-urlencoded',
      'User-Agent' => 'AtD/0.1'
    }

    # Proxies any URL through to AtD. Useful for the TinyMCE
    # plugin.
    def self.proxy(path, params)
      proxy_params = Deadlinez::Proxy.strip_params(params)
      response = post(path,
                      :body => proxy_params,
                      :format => nil,
                      :headers => REQUIRED_HEADERS)
      response.body
    end

    def self.stats(data)
      response = post('/stats',
                     :body => {
                       :data => data
                     },
                     :headers => REQUIRED_HEADERS)
      response['scores']['metric']
    end
  end
end
