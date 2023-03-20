class YoutubeResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
  self.find_record_method = ->(model_class:, id:, params:) {
    model_class.friendly.find id
  }

  field :id, as: :id
  field :title, as: :text
  field :cover, as: :text
  field :description, as: :textarea
  field :url, as: :text
  field :slug, as: :text
  field :authorings, as: :has_many
  field :authors, as: :has_many, through: :authorings
  field :lessons, as: :has_many
end
