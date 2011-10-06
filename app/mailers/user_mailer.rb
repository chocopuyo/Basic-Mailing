class UserMailer < ActionMailer::Base
  default from: "ecocycle.tkb@gmail.com"
  def welcome_email
#    @user.name = "test"
    @url  = "http://example.com/login"
    mail(:to => "chocopuyo@gmail.com", :subject => "Welcome to My Awesome Site")
  end
end
