class SelectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    render 'selects/index'
  end

  def show
    render 'selects/show'
  end

  def new
    @select = current_user.selects.build
  end

  def create
    @select = current_user.selects.build(select_params)
    if @select.save
      redirect_to root_path
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @select = current_user.selects.find(params[:id])
  end

  def update
    @select = current_user.selects.find(params[:id])
    if @select.update(select_params)
      redirect_to select_path(@select)
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    select = current_user.selects.find(params[:id])
    select.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private

  def select_params
    params.require(:select)
  end
end
