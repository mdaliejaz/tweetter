class Api::TweetsController < Api::BaseController
  def index
    respond_with :api, Tweet.all
  end

  def show
    respond_with :api, Tweet.find(params[:id])
  end

  def create
    respond_with :api, Tweet.create(params[:tweet])
  end

  def edit
    respond_with :api, Tweet.find(params[:id])
  end

  def update
    respond_with :api, Tweet.update(params[:id], params[:tweet])
  end

  def destroy
    respond_with :api, Tweet.destroy(params[:tweet])
  end
end
