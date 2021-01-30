# class UsersController < ApplicationController
#   def new
#     @user = current_user
#   end
#   def show
#     @user = current_user
#   end

#   def create
#     @user = current_user.build(user_params)
#     if @user.save
#       redirect_to user_path(@user), notice: '保存できたよ'
#     else
#       flash.now[:error] = '保存に失敗しました'
#       render :new
#     end
#   end

#   def update
#     @user = current_user.find(params[:id])
#     if @user.update(user_params)
#       redirect_to user_path(@user), notice: '更新できました'
#     else
#       flash.now[:error] = '更新できませんでした'
#       render :new
#     end
#   end

#   private
#   def user_params
#     params.require(:user).permit(
#       :income_id,
#       :family_id
#     )
#   end
# end
