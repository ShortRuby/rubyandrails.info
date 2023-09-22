module Helpers
  module SearchHelper
    def search_with_term(term)
      fill_in 'search_term', with: term
      click_button 'Search'
    end
  end
end
