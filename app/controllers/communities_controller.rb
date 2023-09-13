class CommunitiesController < ApplicationController

  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_community, only: %i[show edit update destroy]

  layout "admin", only: %i[new edit]

  def index
    set_meta_tags title: "#{Community.count} communities about Ruby & Ruby on Rails", description: "The largest collection of communitys about Ruby & Ruby on Rails. Find community that will help you learn Ruby 3, Ruby on Rails 7, Hotwire, TurboFrame, and become a better programmer in general", keywords: 'Community, Ruby, Ruby 3, Ruby on Rails 7, Ruby on Rails 6, Hotwire, Turbo Frame, Stimulus, Vue with Rails, React with Rails, Tailwind with Rails, learn ruby, learn ruby on rails'

    @communities = Community.all.order(title: :asc)
    render layout:"index_page"
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new community_params
    if @community.save
      redirect_to community_path(@community)
    else
      render :new
    end
  end

  def show
    @community = Community.friendly.find(params[:id])
    @related = Community.where(id: Community.pluck(:id).sample(3))

    @with_tags = ""
    @with_authors = ""
    @with_related = ""
    @with_lessons = ""


    set_meta_tags title: "Communities #{@community.title}", description: "#{@community.title}. #{@community.description}", keywords: " #{@community.title}"

    render layout:"show_page"
  end

  def edit

  end

  def update
    if @community.update community_params
      redirect_to community_path(@community)
    else
      render :edit
    end
  end

  def destroy
    @community.destroy
    redirect_to communities_path
  end

  private

  def set_community
    @community = Community.friendly.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:title, :description, :url, :cover, :source)
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end
end
