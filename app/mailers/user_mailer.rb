class UserMailer < ActionMailer::Base
  default from: "ecocycle.tkb@gmail.com"
  def welcome_email(user,mail_body)
    @user = user 
    @mail_body = mail_body
    @url  = "ecocycle.com"
    mail(:to => @user.email, :subject => mail_body.title )
  end
end
