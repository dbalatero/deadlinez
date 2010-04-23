require File.dirname(__FILE__) + "/../spec_helper"

describe Deadlinez::Api do
  Deadlinez.api_key = 'testkey'

  describe "#stats" do
    it "should return correct stats" do
      FakeWeb.register_uri(:post,
                           "http://service.afterthedeadline.com/stats",
                           :response => fixture_for('stats.response'))

      data = %Q{Jacobs spent most of his childhood moving around the East Coast with his family, eventually settling in Tampa, Florida. As a drummer he won the 1978 "Most Talented" trophy at Greco Junior High School, but after relocating to Queens, New York (as a result of his parents' divorce), he traded his drums in for a set of turntables apon discovering and marveling over hip hop while the artform was still in an underground developmental stage. He was mentored in the craft by his cousin Rene Negron (a.k.a. DJ-Stretch), and their close friend Shawn Trone (a.k.a. MC Shah-T of the parody-rap group No Face) who suggested Greg use the name "Shah-G". Jacobs liked the idea, but mistakenly thought his friend said "Shock-G", and began using that name instead.}
      result = Deadlinez::Api.stats(data)
      result.should have(4).things
    end
  end
end
