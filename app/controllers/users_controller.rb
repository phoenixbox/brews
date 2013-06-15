class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(params[:user])

    if user.save
      flash[:success] = "User saved!"
      redirect_to user
    else
      flash[:error] = "User not saved!"
      redirect_to :back
    end
  end
end
