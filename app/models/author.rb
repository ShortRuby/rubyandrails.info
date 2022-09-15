# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string
#  content    :text
#  twitterUrl :string
#  githubUrl  :string
#  siteUrl    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  photo      :string
#
class Author < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :authorings, dependent: :destroy

  has_rich_text :content
end
