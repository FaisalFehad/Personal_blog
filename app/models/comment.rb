class Comment < ActiveRecord::Base
  belongs_to :article
  validates :name,    presence: true
  validates :body, presence: true, length: { maximum: 250 }
end
