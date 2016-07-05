class User < ActiveRecord::Base
  has_many :articles
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
