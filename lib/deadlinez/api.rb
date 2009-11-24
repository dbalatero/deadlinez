module Deadlinez
  class Api
    include HTTParty
    format :xml
    base_uri 'service.afterthedeadline.com'

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
