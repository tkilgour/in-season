class UsersController < ApplicationController

  def new_member
    user = User.new
  end

  def new_farmer
    user = User.new
  end

  def create_member
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      byebug
      redirect_to '/'
    else
      redirect_to '/register'
    end
  end

  def create_farmer
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      byebug
      redirect_to '/' //CREATE FARM
    else
      redirect_to '/register'
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_farmer)
  end
end
