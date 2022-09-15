# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Tag < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :taggings, dependent: :destroy
end
