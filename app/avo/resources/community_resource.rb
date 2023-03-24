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
  field :url, as: :text, format_using: ->(handle) { handle.present? ? link_to(handle, handle, target: "_blank") : nil }
  field :slug, as: :text, format_using: ->(handle) { handle.present? ? link_to(handle, "https://rubyandrails.info/communities/#{handle}", target: "_blank") : nil }
  field :source, as: :select, enum: ::Community.sources
  field :cover, as: :text
  field :cover_path, as: :text
end
