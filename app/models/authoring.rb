# == Schema Information
#
# Table name: authorings
#
#  id               :bigint           not null, primary key
#  author_id        :bigint           not null
#  authorabble_type :string           not null
#  authorabble_id   :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Authoring < ApplicationRecord
  belongs_to :author
  belongs_to :authorabble, polymorphic: true
end
