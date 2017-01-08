class Usermailer < ApplicationMailer

  def welcome_email user,sender,reciever, title, content
    @user = user
    @url = "https://mailerlikelion-soojinoh.c9users.io/login"
    @content = content
    mail from: sender,
    to: reciever,
    subject: title,
    body: content
  end

end
