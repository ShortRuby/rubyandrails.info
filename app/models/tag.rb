class Tag < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :taggings, dependent: :destroy
end
