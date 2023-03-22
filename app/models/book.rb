# == Schema Information
#
# Table name: books
#
#  id                 :bigint           not null, primary key
#  title              :string
#  content            :text
#  free               :boolean
#  page               :integer
#  isbn               :string
#  getBookOnAmazonUrl :string
#  getBookOnSiteTitle :string
#  getBookOnSiteUrl   :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  subtitle           :string
#  year               :integer
#  slug               :string
#  cover              :string
#  featured           :boolean
#
class Book < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  has_rich_text :content

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :authorings, as: :authorabble, dependent: :destroy
  has_many :authors, through: :authorings

  validates :title, :content, presence: true

  def self.free_books
    where("free = ?", true)
  end

  def free?
    free.trust
  end

  def next
    self.class.where("id > ?", id).order("id ASC").first || Book.first
  end

  def previous
    self.class.where("id < ?", id).order("id DESC").first || Book.last
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title"]
  end
end
