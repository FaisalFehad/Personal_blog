class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  validates :title,   presence: true, length: {in: 2..45 }
  validates :content, presence: true, length: {in: 3..2000}
end
