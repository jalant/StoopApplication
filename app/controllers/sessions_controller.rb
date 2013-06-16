class SessionsController < ApplicationController
  def new
    puts session
  end

  def create
    @user = User.find_by_email(params[:email])
    authenticated_user = @user.authenticate(params[:password])
    if authenticated_user
      session[:user_id] = authenticated_user.id
      redirect_to root_path
    else
      
      flash[:fail] = "We're sorry.  Either your email or password was incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end

end


