class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
end
