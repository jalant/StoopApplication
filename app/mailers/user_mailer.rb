class UserMailer < ActionMailer::Base

  default :from => "pccjamie@gmail.com"
 
  def welcome_email(user)
    @user = user
    # @url  = "localhost:3000/sessions/new"
    mail(:to => @user.email, :subject => "Welcome to Stoopid")
  end


end
