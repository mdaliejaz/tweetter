class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :username
      t.string :tweetId
      t.text :tweetText

      t.timestamps
    end
  end
end
