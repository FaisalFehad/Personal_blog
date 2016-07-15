require 'rails_helper'

class ArticleForm
  include Capybara::DSL

  def visit_home_page
    visit('/')
    self
  end

  def create_an_article(params = {})
    click_on('New Article', visible: false)
    fill_in('Title', with: params.fetch(:title, "My title"))
    fill_in('Content', with: "My content")
    click_on('Create Article')
    self
  end

  def edit_an_article
    visit('/articles/my-title/edit/')
    fill_in('Title', with: 'Changed title')
    click_on('Update Article')
  end
end
