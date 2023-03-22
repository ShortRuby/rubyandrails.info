class AuthoringResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
  self.visible_on_sidebar = false

  field :id, as: :id
  field :author, as: :belongs_to
  field :authorabble, as: :belongs_to, polymorphic_as: :authorabble, types: [::Book]
end
