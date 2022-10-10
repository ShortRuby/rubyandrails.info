# == Schema Information
#
# Table name: lessons
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  youtube_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Lesson < ApplicationRecord

  extend FriendlyId 
  friendly_id :title, use: :slugged

  belongs_to :youtube
  has_rich_text :description

  validates :title, :url, :description, presence: true

  def next
    Lesson.where("id > ?", id).limit(1).first
  end

  def prev
    Lesson.where("id < ?", id).last
  end

end
