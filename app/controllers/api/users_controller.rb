class Api::UsersController < Api::BaseController

  def create
    respond_with :api, User.create(params[:user_id], params[:password])
  end

  #def update
  #  respond_with :api, User.update(params[:user_id], params[:password])
  #end

  def destroy
    respond_with :api, User.destroy(params[:user_id])
  end
end
