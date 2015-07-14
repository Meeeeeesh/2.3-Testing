class Zombie 
  attr_accessor :name, :username, :password, :image, :location, :bio, :tweets, :created_at

  def initialize
    self.image = 'link to lego zombie'
    self.tweets = []
  end

  def create_tweet(content:, location: nil)
    t = Tweet.new
    t.zombie = self
    t.content = content
    t.location = location
    self.tweets.push(t)
    t
  end



  # def tweet_feed
  # end
end 

z = Zombie.new
z.create_tweet(content: 'Hey')