class UsersController < ApplicationController

  def edit
    # For this tutorial, always edit the first user
    @user = User.first || User.create!(email: '', password: '', timezone: '', public: false, date_of_birth: nil)
  end

  def update
    @user = User.first
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :timezone, :public, :date_of_birth)
  end
end 