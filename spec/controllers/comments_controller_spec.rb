require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
# Create a test admin
  user = User.create( username: "Test admin",
                      email: "rubyblog2016@outlook.com",
                      password: "WeakPass",
                      bio: "test bio" )
end
