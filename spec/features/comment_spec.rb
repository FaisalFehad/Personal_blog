require 'rails_helper'

# The Article from class
require_relative '../support/ArticelForm.rb'
# The User class to use login methods
require_relative '../support/User.rb'

feature "Can leave comments on articles" do
  # initializing the classes
  let(:article_form) {ArticleForm.new}
  let(:user) {User.new}

  scenario 'Admin signs in, creates an article' do
    # signs in as admin
    user.sign_in
    # Creates an article
    article_form.create_an_article
    # leave a comment
    fill_in('Name', with:'My name')
    fill_in('Comment', with: 'comment')
    click_on('Post')
    # Verify
    visit('/articles/my-title/')
    expect(page).to have_content('My name')
    expect(page).to have_content('comment')
  end
end
