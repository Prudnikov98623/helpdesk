class RequestsController < ApplicationController
  before_action :authenticate_user!



  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
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
    params.require(:request).permit(:title, :description, :status, :request_type)
  end

end
