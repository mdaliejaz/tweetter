class Api::TweetsController < Api::BaseController
  def index
    respond_with :api, Tweet.all
  end

  def show
    respond_with :api, Tweet.find(params[:user_id])
  end

  def create
    respond_with :api, Tweet.create(params[:tweet])
  end

  def update
    respond_with :api, Tweet.update(params[:user_id], params[:tweet])
  end

  def destroy
    respond_with :api, Tweet.destroy(params[:user_id])
  end
end
