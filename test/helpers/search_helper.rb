module Helpers
  module SearchHelper
    def search_with_name(name)
      fill_in 'search_term', with: name
      click_button 'Search'
    end
  end
end
