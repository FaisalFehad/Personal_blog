require 'rails_helper'
# The Article from class
require_relative '../support/ArticelForm.rb'
# Requrie the User class (authencation methods)
require_relative '../support/User.rb'


feature "Articles can be posted and edited" do
  # initializing the ArticleForm, User classes
  let(:article_form) {ArticleForm.new}
  let(:user) {User.new}

  scenario 'Visit the home page, post an article then edit it' do
    # Admin needs to sigin as admin before poting an article
    user.sign_in
    # Sign in confirmation notice
    expect(page).to have_text("Signed in successful")
    # Create an article first
    article_form.create_an_article
    # Then Edits the article
    article_form.edit_an_article
    # Go back to the home page to verify the changes
    visit('/')
    expect(page).to have_content('Changed title')
    expect(page).to have_text("My content")
  end
end
