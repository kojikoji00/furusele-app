class HistoryDetailsController < ApplicationController
  def index
    # @history = History.find(params[:id])
    # history_details = @history.history_details
  end

  # def new
  #   history = History.find(params[:history_id])
  #   @history_details = history.history_details.build
  # end

  # def create
  #   history = History.find(params[:history_id])
  #   @history_detail = history.history_detail.build(history_detail_params)
  # end

  private
  # def history_detail_params
  #   params.require(:history_detail).permit(:link, :name, :city, :price, :description, :picture_image_path, :review_image_path)
  # end
end