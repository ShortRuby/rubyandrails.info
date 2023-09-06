# frozen_string_literal: true

class SearchComponentPreview < Lookbook::Preview
  def default
    render SearchComponent.new(path: "/books")
  end

  def with_previous_search_term
    render SearchComponent.new(path: "/books", search_term: "Ruby")
  end
end
