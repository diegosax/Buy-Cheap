class Admin::SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      if user.is_a? Company
        session[:company_id] = user.id
        redirect_to admin_root_url, :notice => "Logged in!"
      else
        session[:user_id] = user.id
        redirect_to after_sign_in_path_for(user), :notice => "Logged in!"
      end

    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:company_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end