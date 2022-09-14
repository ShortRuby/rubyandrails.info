class PagesController < ApplicationController

  def show
    @books = Book.order(created_at: :desc)
    @podcasts = Podcast.all
    @newsletters = Newsletter.all
    @tags = Tag.all

    @featured_book = Book.where(featured: true).where(free: false)
    @featured_newsletter = Newsletter.where(featured: true)
    @featured_podcast = Podcast.where(featured: true)


    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end
end
