class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
