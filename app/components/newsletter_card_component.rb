# frozen_string_literal: true

class NewsletterCardComponent < ViewComponent::Base
  with_collection_parameter :newsletter
  def initialize(newsletter:)
    @newsletter = newsletter
  end

end
