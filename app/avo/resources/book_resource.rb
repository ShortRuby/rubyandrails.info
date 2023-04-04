class BookResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], title_cont: params[:q], m: "or").result(distinct: false)
  end
  self.find_record_method = ->(model_class:, id:, params:) {
    model_class.friendly.find id
  }

  field :id, as: :id, link_to_resource: true
  field :title, as: :text
  field :content, as: :trix

  panel do
    field :subtitle, as: :text
    field :getBookOnAmazonUrl, name: "Amazon URL", as: :text, format_using: ->(url) { url.present? ? link_to(url, url, target: "_blank") : nil }
    field :getBookOnSiteTitle, name: "Site Title", as: :text
    field :getBookOnSiteUrl, name: "Site URL", as: :text, format_using: ->(handle) { handle.present? ? link_to(handle, handle, target: "_blank") : nil }
    field :isbn, as: :text
    field :year, as: :number
  end
  field :authors, as: :has_many, through: :authorings, attach_scope: -> { query.order(name: :asc) }
  field :tags, as: :has_many, through: :taggings

  sidebar do
    field :featured, as: :boolean
    field :free, as: :boolean
    field :cover, as: :text, only_on: :forms
    field :cover, as: :external_image, hide_on: :forms do |model, resource|
      "/books/#{model.cover}.webp"
    end
  end
end
