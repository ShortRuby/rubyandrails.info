class Author < ApplicationRecord
  has_many :authorings, dependent: :destroy

  has_rich_text :content
end
