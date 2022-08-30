class Course < ApplicationRecord
  extend FriendlyId 
  friendly_id :title, use: :slugged

  has_rich_text :content

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :authorings, as: :authorabble, dependent: :destroy
  has_many :authors, through: :authorings

  validates :title, :content, presence: true
end
