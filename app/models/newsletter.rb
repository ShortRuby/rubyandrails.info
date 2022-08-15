class Newsletter < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content
  
  validates :title, :content, :url, presence: true
end
