# frozen_string_literal: true

class AuthorCardComponent < ViewComponent::Base
  with_collection_parameter :author
  def initialize(author:)
    @author = author
  end

end
