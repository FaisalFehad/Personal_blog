require 'rails_helper'

class User
  include Capybara::DSL

  def sign_in
    visit('/users/sign_in/')
    fill_in('Email', with:'rubyblog2016@outlook.com')
    fill_in('Password', with:'WeakPass')
    click_on('Sign in')
  end

  def logout
    visit('/users/sign_in_out/')
    click_on('Logout')
  end
end
