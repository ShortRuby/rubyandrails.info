# frozen_string_literal: true

class SearchTermComponentPreview < Lookbook::Preview
  def default
    render SearchTermComponent.new(search_term: "Ruby")
  end

  def when_search_term_is_nil_or_empty
    render SearchTermComponent.new()
  end
end
