# frozen_string_literal: true

class TagsCardComponent < ViewComponent::Base
  with_collection_parameter :tag
  def initialize(tag:)
    @tag = tag
  end

end
