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
  field :twitterUrl, name: "Titter Handle", as: :text, format_using: ->(handle) { handle.present? ? link_to("@#{handle}", "https://twitter.com/#{handle}", target: "_blank") : nil }
  field :githubUrl, name: "GitHub Handle", as: :text, format_using: ->(handle) { handle.present? ? link_to("@#{handle}", "https://github.com/#{handle}", target: "_blank") : nil }
  field :siteUrl, name: "Site URL", as: :text
  field :slug, as: :text
  field :photo, as: :text

  field :books, as: :has_many, through: :taggings
  field :courses, as: :has_many, through: :taggings
  field :newsletters, as: :has_many, through: :taggings
  field :podcasts, as: :has_many, through: :taggings
  field :screencasts, as: :has_many, through: :taggings
  field :youtubes, as: :has_many, through: :taggings
end
