module Deadlinez
  class Api
    include HTTParty
    format :xml
    base_uri 'service.afterthedeadline.com'

    # Proxies any URL through to AtD. Useful for the TinyMCE
    # plugin.
    def self.proxy(path, params)
      proxy_params = Deadlinez::Proxy.strip_params(params)
      proxy_params['key'] = Deadlinez.api_key
      response = get(path,
                      :query => params,
                      :format => nil)
      response.body
    end

    def self.stats(data)
      response = get('/stats',
                     :query => {
                       :data => data,
                       :key => Deadlinez.api_key
                     })
      response['scores']['metric']
    end

    def self.verify(key = Deadlinez.api_key)
      response = get('/verify',
                     :query => {
                       :key => key
                     })
      response.body.strip == 'valid'
    end
  end
end
