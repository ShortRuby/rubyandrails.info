# frozen_string_literal: true

class Layout::HeroComponent < ViewComponent::Base
  renders_one :image
  renders_one :link

  def initialize(title:, bg_color:, bg:, second:false, path: "")
    @title = title
    @bg_color = bg_color
    @bg = bg
    @second = second
    @path = path
  end

end
