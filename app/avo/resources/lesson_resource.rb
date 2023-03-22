class LessonResource < Avo::BaseResource
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
  field :description, as: :trix
  field :url, as: :text, format_using: ->(value) { value.present? ? link_to(value, "https://www.youtube.com/watch?v=#{value}", target: "_blank") : nil }
  field :youtube_id, as: :number
  field :slug, as: :text, format_using: ->(value) { value.present? ? link_to(value, "https://rubyandrails.info/youtubes/#{value}", target: "_blank") : nil }
  field :youtube, as: :belongs_to
end
