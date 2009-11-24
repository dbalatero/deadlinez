require File.dirname(__FILE__) + "/../spec_helper"

describe Deadlinez::Api do
  Deadlinez.api_key = 'testkey'

  describe "#stats" do
    it "should return correct stats" do
      FakeWeb.register_uri(:get,
                           "http://service.afterthedeadline.com/stats?key=testkey&data=Jacobs%20spent%20most%20of%20his%20childhood%20moving%20around%20the%20East%20Coast%20with%20his%20family%2C%20eventually%20settling%20in%20Tampa%2C%20Florida.%20As%20a%20drummer%20he%20won%20the%201978%20%22Most%20Talented%22%20trophy%20at%20Greco%20Junior%20High%20School%2C%20but%20after%20relocating%20to%20Queens%2C%20New%20York%20(as%20a%20result%20of%20his%20parents'%20divorce)%2C%20he%20traded%20his%20drums%20in%20for%20a%20set%20of%20turntables%20apon%20discovering%20and%20marveling%20over%20hip%20hop%20while%20the%20artform%20was%20still%20in%20an%20underground%20developmental%20stage.%20He%20was%20mentored%20in%20the%20craft%20by%20his%20cousin%20Rene%20Negron%20(a.k.a.%20DJ-Stretch)%2C%20and%20their%20close%20friend%20Shawn%20Trone%20(a.k.a.%20MC%20Shah-T%20of%20the%20parody-rap%20group%20No%20Face)%20who%20suggested%20Greg%20use%20the%20name%20%22Shah-G%22.%20Jacobs%20liked%20the%20idea%2C%20but%20mistakenly%20thought%20his%20friend%20said%20%22Shock-G%22%2C%20and%20began%20using%20that%20name%20instead.",
                           :response => fixture_for('stats.response'))

      data = %Q{Jacobs spent most of his childhood moving around the East Coast with his family, eventually settling in Tampa, Florida. As a drummer he won the 1978 "Most Talented" trophy at Greco Junior High School, but after relocating to Queens, New York (as a result of his parents' divorce), he traded his drums in for a set of turntables apon discovering and marveling over hip hop while the artform was still in an underground developmental stage. He was mentored in the craft by his cousin Rene Negron (a.k.a. DJ-Stretch), and their close friend Shawn Trone (a.k.a. MC Shah-T of the parody-rap group No Face) who suggested Greg use the name "Shah-G". Jacobs liked the idea, but mistakenly thought his friend said "Shock-G", and began using that name instead.}
      result = Deadlinez::Api.stats(data)
      result.should have(4).things
    end
  end

  describe "#verify" do
    it "should return false if the key is bad" do
      FakeWeb.register_uri(:get,
                           'http://service.afterthedeadline.com/verify?key=badkey',
                           :body => "invalid\n")
      result = Deadlinez::Api.verify('badkey')
      result.should be_false
    end

    it "should return true if the key is good" do
      FakeWeb.register_uri(:get,
                           'http://service.afterthedeadline.com/verify?key=goodkey',
                           :body => "valid\n")
      result = Deadlinez::Api.verify('goodkey')
      result.should be_true
    end
  end
end
