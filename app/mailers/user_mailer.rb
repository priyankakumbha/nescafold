class UserMailer < ApplicationMailer

default from:"welcome@uber_eats.com"

  def welcome(user)
    @user = user
    mail( :to => @user.email, :subject => "Welcome to our food delivery", :cc => "users@nescafold.com")
  end

  def order(user)
    @user = user
    mail( :from =>"welcome@uber_eats.com", :to => @user.email, :subject => "A summary of your order ", :cc => "orders@uber_eats.com")
  end
end
