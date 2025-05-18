module Admin
  class UsersController < ApplicationController
    # GET /admin/users
    def index
      @users = User.order(:id)
    end

    # GET /admin/users/:id/edit
    def edit
      @user = User.find(params[:id])
    end

    # PATCH/PUT /admin/users/:id
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/users/:id
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully deleted.'
    end

    private

    def user_params
      params.require(:user).permit(:email_address, :admin)
    end
  end
end