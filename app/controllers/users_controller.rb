class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @sites = @user.sites.page(params[:page]).per(params[:per])
  end
end
