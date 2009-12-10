module Deadlinez
  class Proxy
    def self.strip_params(params)
      copy = params.dup
      [:action, :controller, :path].each do |k|
        copy.delete(k)
      end
      copy
    end
  end
end
