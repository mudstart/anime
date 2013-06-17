class ConfirmUsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_if_confirmed

  def index
    @users = User.all
  end


  def update
    user = User.find params[:id]
    user.update_attribute(:confirmed, true)

    redirect_to :back
  end
end