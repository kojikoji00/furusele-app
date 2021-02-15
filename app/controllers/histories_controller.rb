class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :destory]
  def index
    @histories = current_user.histories.all.order(created_at: :DESC)
  end

  def show
    @history = History.find(params[:id])
    # @history_detail = HistoryDetail.find_by(params[:history_id])

    @history_details = HistoryDetail.where(history_id: @history.id)
    income = current_user.income_id
    family = current_user.family_id
    @deduction = DeductionList.find_by(income_id: income, family_id: family)
  end

  def destoroy
    
  end

  private
  def history_params
    # params.require(:history).permit(:category_id)
  end
end
