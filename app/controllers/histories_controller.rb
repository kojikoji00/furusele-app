class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new show create]
  def new
    @history = current_user.histories.build
  end

  def create
    @history = current_user.histories.build(history_params)
    if @history.save
      redirect_to history_path(@history), notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def show
    @history = History.find(params[:id])
    income = current_user.income_id
    family = current_user.family_id
    @deduction = DeductionList.find_by(income_id: income, family_id: family)
  end
  
  private
  def history_params
    params.require(:history).permit(:category_id)
  end
end