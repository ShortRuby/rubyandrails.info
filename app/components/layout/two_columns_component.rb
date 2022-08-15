# frozen_string_literal: true

class Layout::TwoColumnsComponent < ViewComponent::Base

  renders_one :data

  def initialize(title:, attr: "")
    @title = title
    @attr = attr 
  end

end
