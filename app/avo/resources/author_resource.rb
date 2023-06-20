class AuthorResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false)
  end
  self.find_record_method = ->(model_class:, id:, params:) {
    model_class.friendly.find id
  }

  field :id, as: :id
  field :name, as: :text
  field :content, as: :trix
  field :twitter_url, name: "Twitter link", as: :text, format_using: ->(handle) { handle.present? ? link_to(handle, handle, target: "_blank") : nil }
  field :mastodon_url, name: "Mastodon link", as: :text, format_using: ->(handle) { handle.present? ? link_to(handle, handle, target: "_blank") : nil }
  field :github_url, name: "GitHub link", as: :text, format_using: ->(handle) { handle.present? ? link_to(handle, handle, target: "_blank") : nil }
  field :website_url, name: "Site URL", as: :text, format_using: ->(handle) { handle.present? ? link_to(handle, handle, target: "_blank") : nil }
  field :slug, as: :text, format_using: ->(handle) { handle.present? ? link_to(handle, "https://rubyandrails.info/people/#{handle}", target: "_blank") : nil }
  field :photo, as: :text

  field :books, as: :has_many, through: :taggings
  field :courses, as: :has_many, through: :taggings
  field :newsletters, as: :has_many, through: :taggings
  field :podcasts, as: :has_many, through: :taggings
  field :screencasts, as: :has_many, through: :taggings
  field :youtubes, as: :has_many, through: :taggings
end
