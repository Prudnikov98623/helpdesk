# app/controllers/transfer_requests_controller.rb
class TransferRequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @request = Request.find(params[:request_id])
    @roles = Role.all
  end

  def create
    request = Request.find(params[:request_id])
    user = User.find_by(id: params[:target_user_id])

    if user
      request.update(responsible_user: user)
      redirect_to request, notice: 'Заявка передана'
    else
      redirect_to request, alert: 'Пользователь не найден'
    end
  end

end
