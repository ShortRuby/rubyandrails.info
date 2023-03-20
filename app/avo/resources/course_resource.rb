class CourseResource < Avo::BaseResource
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
  field :content, as: :textarea
  field :free, as: :boolean
  field :courseSiteTitle, name: "Site title", as: :text
  field :courseSiteUrl, name: "Site URL", as: :text, format_using: ->(url) { url.present? ? link_to(url, url, target: "_blank") : nil }
  field :slug, as: :text, only_on: :forms
  field :slug, as: :text, hide_on: :forms, format_using: ->(url) { url.present? ? link_to(url, "/courses/#{url}", target: "_blank") : nil }
  field :cover, as: :text
  field :authors, as: :has_many, through: :authorings

  sidebar do
    field :cover, as: :text, only_on: :forms
    field :cover_path, as: :external_image
  end
end
