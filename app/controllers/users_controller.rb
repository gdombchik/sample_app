class UsersController < ApplicationController
  def index
    @user = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end
end
