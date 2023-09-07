# frozen_string_literal: true

class SearchTermComponent < ApplicationComponent
  def initialize(search_term: nil)
    @search_term = ERB::Util.html_escape(search_term)
  end

  def template
    return unless @search_term.present?

    div(class: "pb-12") do
      strong { "Search Term: #{@search_term}" }
    end
  end
end
