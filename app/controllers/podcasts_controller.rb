class PodcastsController < ApplicationController
  
  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_podcast, only: %i[show edit update destroy]

  layout "admin", only: %i[new edit]

  def index
    set_meta_tags title: "#{Podcast.count} podcasts about Ruby & Ruby on Rails", description: "#{Podcast.count} podcasts about development, Ruby, Ruby on Rails. Learn from experienced developers, discover how to learn programming, and just have fun", keywords: "Podcast, Ruby, Ruby on Rails, best podcasts about programming"

    @podcasts = Podcast.all.order created_at: :desc
    @featured = Podcast.where(featured: true)
    @tags = Tag.all.order(:title)
    @random = Podcast.where(id: Podcast.pluck(:id).sample) 

    render layout:"index_page"
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new podcast_params
    if @podcast.save
      redirect_to podcast_path(@podcast)
    else
      render :new
    end
  end

  def show
    set_meta_tags title: "Podcast #{@podcast.title}", description: "#{@podcast.title}. #{@podcast.content}", keywords: "#{@podcast.title}, podcast, Ruby, Ruby on Rails"

    @podcast = Podcast.friendly.find(params[:id])
    @related = Podcast.where(id: Podcast.pluck(:id).sample(3)) 
    @random = Podcast.where(id: Podcast.pluck(:id).sample) 

    @with_related = @related.empty?
    @with_tags = "" 
    @with_authors = @podcast.authors.empty? 
    @with_lessons = ""

    render layout:"show_page"

  end

  def edit
  end

  def update
    if @podcast.update podcast_params
      redirect_to podcast_path(@podcast)
    else
      render :edit
    end
  end

  def destroy
    @podcast.destroy
    redirect_to podcasts_path
  end

  private
  
  def set_podcast
    @podcast = Podcast.friendly.find(params[:id])
  end

  def podcast_params
    params.require(:podcast).permit(:title, :content, :cover, :url, :featured, author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end

end
