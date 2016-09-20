class UserMailer < ApplicationMailer

default from:"contact@nescafold.com"

  def welcome(user)
    @user = user
    mail( :to => @user.email, :subject => "Welcome to Nescafold coffee delivery", :cc => "users@nescafold.com")
  end
end
