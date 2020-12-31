class HomesController < ApplicationController
  def index
    render 'home/index'
  end

  def show
    render 'home/show'
  end
end
