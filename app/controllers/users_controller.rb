class UsersController < ApplicationController

 def new_member
   user = User.new
 end

 def new_farmer
   user = User.new
 end

 def create
   user = User.new(user_params)
   if user.save
     session[:user_id] = user.id
     if user.is_farmer
       redirect_to new_farm_path
     else
       redirect_to '/'
     end
   end
 end

private

 def user_params
   params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_farmer)
 end
end
