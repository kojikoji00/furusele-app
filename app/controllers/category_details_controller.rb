class CategoryDetailsController < ApplicationController
  def index
    @category_details = CategoryDetail.all
  end
end