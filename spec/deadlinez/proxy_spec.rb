require File.dirname(__FILE__) + "/../spec_helper"

describe Deadlinez::Proxy do
  describe "#strip_params" do
    it "should remove action and controller" do
      params = { :action => 'something',
                 :controller => 'whatever',
                 :key => '89fdsa8fd88a99s9ss' }
      result = Deadlinez::Proxy.strip_params(params)
      result[:action].should be_nil
      result[:controller].should be_nil
    end
  end
end
