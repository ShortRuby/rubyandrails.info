# frozen_string_literal: true

class Filter
  ORDER_BY_FIELD = :created_at
  ORDER_BY_DIRECTION = :desc

  def initialize(scope)
    @scope = scope
  end

  def filter(search_term) = search(search_term).order(order_by)

  private
    attr_reader :scope

    def search(search_term) = scope.ransack(title_cont: search_term).result

    def order_by = { ORDER_BY_FIELD => ORDER_BY_DIRECTION }
end
