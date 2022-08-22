class NewslettersController < ApplicationController
  
  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_newsletter, only: %i[show edit update destroy]

  def index
    set_meta_tags title: "#{Newsletter.count} newsletters about Ruby & Ruby on Rails", description: "#{Newsletter.count} newsletters about development, Ruby, Ruby on Rails. Learn from experienced developers, discover how to learn programming, and just have fun", keywords: "Newsletter, Ruby, Ruby on Rails, best newsletters about programming"
 
    @newsletters = Newsletter.all.order created_at: :desc
    @featured = Newsletter.where(featured: true)
    @tags = Tag.all.order(:title)
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
    @more_newsletters = Newsletter.where(id: Newsletter.pluck(:id).sample(3)) 

    set_meta_tags title: "Newsletter #{@newsletter.title}", description: "#{@newsletter.title}. #{@newsletter.content}", keywords: "#{@newsletter.title}, newsletter, Ruby, Ruby on Rails"
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
    params.require(:newsletter).permit(:title, :content, :author, :cover, :url, :featured)
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end

end
