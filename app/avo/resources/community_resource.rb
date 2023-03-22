class CommunityResource < Avo::BaseResource
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
  field :description, as: :textarea
  field :url, as: :text
  field :slug, as: :text
  field :source, as: :select, enum: ::Community.sources

  sidebar do
    field :cover, as: :text, only_on: :forms
    field :cover_path, as: :external_image
  end
end
