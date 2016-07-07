class Article < ActiveRecord::Base
  # association
  has_many :comments, dependent: :destroy
  belongs_to :user
  # FriendlyId
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  # validation
  validates :title,   presence: true, length: {in: 2..45 }
  validates :content, presence: true, length: {in: 3..2000}
  # paperclip
  has_attached_file :image, styles: { article: "700x400>", thumb: "100x100>" },
   default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :article, content_type: /\Aimage\/.*\Z/
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


end
