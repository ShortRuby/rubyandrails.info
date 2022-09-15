# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  date        :string
#  url         :string
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :description, :url, presence: true
end
