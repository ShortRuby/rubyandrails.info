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
  has_many :books, through: :authorings, source: :authorabble, source_type: "Book"
  has_many :courses, through: :authorings, source: :authorabble, source_type: "Course"
  has_many :newsletters, through: :authorings, source: :authorabble, source_type: "Newsletter"
  has_many :podcasts, through: :authorings, source: :authorabble, source_type: "Podcast"
  has_many :screencasts, through: :authorings, source: :authorabble, source_type: "Screencast"
  has_many :youtubes, through: :authorings, source: :authorabble, source_type: "Youtube"

  has_rich_text :content

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name"]
  end
end
