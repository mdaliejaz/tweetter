class Api::TweetsController < Api::BaseController
  def index
    respond_with :api, Tweet.all
  end

  def show
    respond_with :api, Tweet.find(params[:tweetId])
  end

  def create
    respond_with :api, Tweet.create(params[:tweetText])
  end

  def edit
    respond_with :api, Task.find(params[:tweetId])
  end

  def update
    respond_with :api, Tweet.update(params[:tweetId], params[:tweetText])
  end

  def destroy
    respond_with :api, Tweet.destroy(params[:tweetId])
  end
end
