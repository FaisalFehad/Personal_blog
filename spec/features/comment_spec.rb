require 'rails_helper'

require_relative '../support/ArticelForm.rb'
feature "Can leave comments on articles" do
  # initializing the ArticleForm class
  let(:article_form) {ArticleForm.new}

  scenario 'Visit the home page, post an article then edit it' do
    # Create an article first
    article_form.visit_home_page.create_an_article
    # View the article
    visit('/articles/my-title/')
    # leave a comment
    fill_in('Name', with:'user_name')
    fill_in('Comment', with: 'comment')
    click_on('Post')
    # Verify
    visit('/articles/my-title/')
    expect(page).to have_content('user_name')
    expect(page).to have_content('comment')
  end
end
