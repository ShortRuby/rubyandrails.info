# frozen_string_literal: true

class BookCoverComponent < ViewComponent::Base
  def initialize(book:)
    @book = book
  end

end
