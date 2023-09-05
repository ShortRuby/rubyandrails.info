class ScreencastsController < ApplicationController

  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_screencast, only: %i[show edit update destroy]

  layout "admin", only: %i[new edit]
  
  def index
    set_meta_tags title: "#{Screencast.count} screencasts about Ruby & Ruby on Rails", description: "The largest collection of screencasts about Ruby & Ruby on Rails. Find screencast that will help you learn new versions of Ruby 3, Ruby on Rails 7, Hotwire, TurboFrame, and become a better programmer in general", keywords: 'Screencast, Ruby, Ruby 3, Ruby on Rails 7, Ruby on Rails 6, Hotwire, Turbo Frame, Stimulus, Vue with Rails, React with Rails, Tailwind with Rails, learn ruby, learn ruby on rails'

    filtered_screencasts = Screencast.ransack(title_cont: search_term).result
    @screencasts = filtered_screencasts.order(created_at: :asc)
    @random = Screencast.where(id: Screencast.pluck(:id).sample) 

    render layout:"index_page"
  end

  def new
    @screencast = Screencast.new
  end

  def create
    @screencast = Screencast.new screencast_params
    if @screencast.save
      redirect_to screencast_path(@screencast)
    else
      render :new
    end
  end

  def show
    @screencast = Screencast.friendly.find(params[:id])
    @similar = Screencast.where(id: Screencast.pluck(:id).sample(3)) 
    @random = Screencast.where(id: Screencast.pluck(:id).sample) 

    @with_tags = "" 
    @with_authors = @screencast.authors.empty?
    @with_related = ""
    @with_lessons = ""

    set_meta_tags title: "Screencast #{@screencast.title}", description: "#{@screencast.title} by #{@screencast.authors.map { |author| author.name}.join(", ").html_safe}. #{@screencast.content}", keywords: " #{@screencast.title}, #{@screencast.authors.map { |author| author.name}.join(", ").html_safe}"

    render layout:"show_page"
  end

  def edit

  end

  def update
    if @screencast.update screencast_params
      redirect_to screencast_path(@screencast)
    else
      render :edit
    end
  end

  def destroy
    @screencast.destroy
    redirect_to screencasts_path
  end
  
  private

  def set_screencast
    @screencast = Screencast.friendly.find(params[:id])
  end

  def screencast_params
    params.require(:screencast).permit(:title, :content, :url, author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end

  def search_term
    params[:search_term]&.strip&.downcase
  end
end
