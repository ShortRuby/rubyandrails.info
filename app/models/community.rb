class Community < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :url, presence: true

  enum :source, {reddit: 0, discord: 1, forum: 2, slack: 3, twitter: 4}
end
