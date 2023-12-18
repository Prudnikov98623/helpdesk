class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @requests = @user.requests
  end
end
