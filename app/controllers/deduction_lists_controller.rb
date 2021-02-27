class DeductionListsController < ApplicationController
  def new
    # income = Income.new(id: params[:income_id])
    # family = Family.new(id: params[:family_id])
    # @deduction = DeductionList.find_by(income_id: income, family_id: family)
    # binding.pry
  end

  def create
    income = Income.new(id: params[:income_id])
    family = Family.new(id: params[:family_id])
    @deduction = DeductionList.find_by(income_id: income, family_id: family)
    redirect_to new_category_path

  end
end