class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your profile was updated successfully!'
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
    end

    redirect_to edit_user_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :height)
  end
end
