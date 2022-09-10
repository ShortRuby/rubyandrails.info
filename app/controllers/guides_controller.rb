class GuidesController < ApplicationController

  def show
    @books = Book.order(created_at: :desc)
    @podcasts = Podcast.all
    @newsletters = Newsletter.all
    @tags = Tag.all

    if valid_page?
      render template: "guides/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/guides/#{params[:page]}.html.erb"))
  end
end
