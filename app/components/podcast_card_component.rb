# frozen_string_literal: true

class PodcastCardComponent < ViewComponent::Base
  with_collection_parameter :podcast
  def initialize(podcast:)
    @podcast = podcast
  end

end
