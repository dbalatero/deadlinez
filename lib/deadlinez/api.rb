module Deadlinez
  class Api
    include HTTParty
    format :xml
    base_uri 'service.afterthedeadline.com'

    # Proxies any URL through to AtD. Useful for the TinyMCE
    # plugin.
    def self.proxy(path, params)
      proxy_params = Deadlinez::Proxy.strip_params(params)
      response = post(path,
                      :body => proxy_params,
                      :format => nil,
                      :headers => {
                        'Host' => 'service.afterthedeadline.com',
                        'Content-Type' => 'application/x-www-form-urlencoded',
                        'User-Agent' => 'AtD/0.1'
                      })
      response.body
    end

    def self.stats(data)
      response = post('/stats',
                     :body => {
                       :data => data
                     })
      response['scores']['metric']
    end
  end
end
