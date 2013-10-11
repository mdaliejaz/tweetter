class Tweet < ActiveRecord::Base
  attr_accessible :username, :tweetText
end
