class TagResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], title_cont: params[:q], m: "or").result(distinct: false)
  end
  self.find_record_method = ->(model_class:, id:, params:) {
    model_class.friendly.find id
  }

  field :id, as: :id
  field :title, as: :text
  field :slug, as: :text
  # field :taggings, as: :has_many, polymorphic_as: :taggings, types: [::Book, ::Course, ::Youtube]
  field :books, as: :has_many, through: :taggings
  field :courses, as: :has_many, through: :taggings
  field :youtubes, as: :has_many, through: :taggings
end
