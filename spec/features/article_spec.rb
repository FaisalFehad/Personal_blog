require 'rails_helper'

feature "Create a post" do
  scenario  "Visit the home page and post an article" do
    visit '/'
    click_link('New Article')
    fill_in("Title", with: "foo")
    fill_in("Content", with: "bar baz")
    click_on("Create Article")

    visit('/')
    expect(page).to have_text("foo")
    expect(page).to have_text("bar baz")

  end
end
