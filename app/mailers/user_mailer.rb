class UserMailer < ActionMailer::Base
  default from: "parentfeedbacks@gmail.com"

  def user_email(user)
    @user = user
    mail(:to => "<#{@user.email}>", :subject => "Account created")
  end
end
