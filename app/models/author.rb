class Author < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :authorings, dependent: :destroy

  has_rich_text :content
end
