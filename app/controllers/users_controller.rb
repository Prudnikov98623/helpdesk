class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @requests = @user.requests
  end

  def users_by_role
    role_id = params[:role_id]
    @users = User.where(role_id: role_id)
    respond_to do |format|
      format.json { render json: @users.pluck(:id, :email) }
    end
  end

end
