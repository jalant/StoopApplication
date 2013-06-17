class SessionsController < ApplicationController
  def new
    puts session
  end

 def create
    @user = User.find_by_email(params[:email])
    if @user
      authenticated_user = @user.authenticate(params[:password])
      if authenticated_user
        session[:user_id] = authenticated_user.id
        redirect_to root_path
      else
        flash[:fail] = "We're sorry.  Either your email or password was incorrect"
        render :new
      end
    else
      flash[:fail] = "You don't currently have an account.  Please create an account now!"
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end

end


