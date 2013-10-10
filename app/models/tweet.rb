class Tweet < ActiveRecord::Base
  attr_accessible :username, :tweetId, :tweetText
end
