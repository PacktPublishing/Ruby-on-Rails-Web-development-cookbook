class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.users.build
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to dashboard_path, notice: "Workspace created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def dashboard
  end

  private

  def account_params
    params.require(:account).permit(
      :name,
      users_attributes: %i[email password password_confirmation]
    )
  end
end

