# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(title:, path:, shop: false)
    @title = title
    @path = path
    @shop = shop
  end

end
