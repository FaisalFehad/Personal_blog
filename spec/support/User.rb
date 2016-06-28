require 'rails_helper'

class User
  include Capybara::DSL


  def sign_up
    visit('/users/sign_up/')
    fill_in('Email', with:'agmin@agmin.com')
    fill_in('Password', with:'Password12')
    click_on('Sign up')
  end

  def sign_in
    visit('/users/sign_in/')
    fill_in('Email', with:'agmin@agmin.com')
    fill_in('Password', with:'Password12')
    click_on('Login')
  end

  def logout
    visit('/')
    click_on('Logout')
  end
end
