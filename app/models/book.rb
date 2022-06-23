class Book < ApplicationRecord
  extend FriendlyId 
  friendly_id :title, use: :slugged

  has_rich_text :content

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :authorings, as: :authorabble, dependent: :destroy
  has_many :authors, through: :authorings

  validates :title, :content, presence: true


  def free?
    free.trust
  end

  def next
    self.class.where("id > ?", id).order("id ASC").first || Book.first
  end
  
  def previous 
    self.class.where("id < ?", id).order("id DESC").first || Book.last
  end
end
