class RequestsController < ApplicationController
  before_action :authenticate_user!



  def index
    case current_user.role.role_name
    when 'Менеджер'
      @requests = Request.all
    when 'Первая линия'
      @requests = Request.where(responsible_user_id: current_user.id)
    when 'Вторая линия'
      @requests = Request.joins(:responsible_user).where(users: { role_id: Role.find_by(role_name: 'Третья линия').id })
    when 'Третья линия'
      @requests = Request.none # Третья линия не видит заявки других линий
    else
      @requests = Request.none # Для других ролей не предусмотрено видение заявок
    end
  end

  def show
    @request = Request.find(params[:id])
    @user = @request.responsible_user if @request.responsible_user
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to @request
    else
      render 'new'
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to @request
    else
      render 'edit'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path, notice: 'Заявка удалена.'
  end


  private

  def request_params
    params.require(:request).permit(:title, :description, :status, :request_type, :responsible_user_id)
  end

end
