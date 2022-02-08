class Authoring < ApplicationRecord
  belongs_to :author
  belongs_to :authorabble, polymorphic: true
end
