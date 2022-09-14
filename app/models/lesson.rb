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
    Lesson.where("id < ?", id).limit(1).first
  end

end
