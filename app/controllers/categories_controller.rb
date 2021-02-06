class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @categories = Category.all

  end
  def create
    @category = Category.new(category_params)
    if @category.save
    else
      rebder :new
    end
  end

  def index
    @categories = Category.all
  end

  private
  def category_params
    params.require(:category.permit(:name))
  end
end
