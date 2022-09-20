class NewslettersController < ApplicationController
  
  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_newsletter, only: %i[show edit update destroy]

  layout "admin", only: %i[new edit]

  def index
    set_meta_tags title: "#{Newsletter.count} newsletters about Ruby & Ruby on Rails", description: "#{Newsletter.count} newsletters about development, Ruby, Ruby on Rails. Learn from experienced developers, discover how to learn programming, and just have fun", keywords: "Newsletter, Ruby, Ruby on Rails, best newsletters about programming"
 
    @newsletters = Newsletter.all.order created_at: :desc
    @featured = Newsletter.where(featured: true)
    @tags = Tag.all.order(:title)
    @random = Newsletter.where(id: Newsletter.pluck(:id).sample) 

    render layout:"index_page"
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new newsletter_params
    if @newsletter.save
      redirect_to newsletter_path(@newsletter)
    else
      render :new
    end
  end

  def show
    @newsletter = Newsletter.friendly.find(params[:id])
    @tags = Tag.all.order(:title)
    @related = Newsletter.where(id: Newsletter.pluck(:id).sample(3)) 

    @with_tags = "" 
    @with_authors = @newsletter.authors.empty?
    @with_related = @related.empty?
    @with_lessons = ""

    set_meta_tags title: "Newsletter #{@newsletter.title}", description: "#{@newsletter.title}. #{@newsletter.content}", keywords: "#{@newsletter.title}, newsletter, Ruby, Ruby on Rails"

    render layout:"show_page"
  end

  def edit
  end

  def update
    if @newsletter.update newsletter_params
      redirect_to newsletter_path(@newsletter)
    else
      render :edit
    end
  end

  def destroy
    @newsletter.destroy
    redirect_to newsletter_path
  end

  private
  
  def set_newsletter 
    @newsletter = Newsletter.friendly.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:title, :content, :cover, :url, :featured, :testimonial_text, :testimonial_author, :testimonial_link, :featured_cover, author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end

end
