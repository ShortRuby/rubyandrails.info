class TaggingResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :tag, as: :belongs_to
  field :taggable, as: :belongs_to, polymorphic_as: :taggable, types: [::Book, ::Course, ::Youtube]
end
