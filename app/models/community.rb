# == Schema Information
#
# Table name: communities
#
#  id          :bigint           not null, primary key
#  title       :string
#  cover       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string
#  slug        :string
#  source      :integer
#
class Community < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :url, presence: true

  enum :source, {reddit: 0, discord: 1, forum: 2, slack: 3, twitter: 4}
end
