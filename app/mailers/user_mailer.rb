class UserMailer < ActionMailer::Base
  default from: "joesbooks113@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "http://joesbooks.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to Joe's Books")
  end

  def admin_notify_email(user)
    @user = user
    @url  = "http://joesbooks.herokuapp.com"
    mail(:to => "newton10471@gmail.com", :subject => "new user #{@user.first_name} #{@user.last_name} signed up")
  end
end
