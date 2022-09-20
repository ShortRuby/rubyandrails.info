class YoutubesController < ApplicationController

  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_youtube, only: %i[show edit update destroy]
  
  def index
    set_meta_tags title: "#{Youtube.count} Youtube courses about Ruby & Ruby on Rails", description: "", keywords: 'Youtube courses, free course, Ruby, Ruby 3, Ruby on Rails 7, Ruby on Rails 6, Hotwire, Turbo Frame, Stimulus, Vue with Rails, React with Rails, Tailwind with Rails, learn ruby, learn ruby on rails'

    @youtubes = Youtube.all.order(created_at: :desc)
    render layout:"index_page"
  end

  def new
    @youtube = Youtube.new
  end

  def create
    @youtube = Youtube.new youtube_params
    if @youtube.save
      redirect_to youtube_path(@youtube)
    else
      render :new
    end
  end

  def show
    @youtube = Youtube.friendly.find(params[:id])
    @first_lesson = first_lesson(params[:id]) 

    @related = Youtube.where(id: Youtube.pluck(:id).sample).limit(3)

    render layout:"show_page"
  end


  def edit

  end

  def update
    if @youtube.update youtube_params
      redirect_to youtube_path(@youtube)
    else
      render :edit
    end
  end

  def destroy
    @youtube.destroy
    redirect_to youtubes_path
  end

  private

  def first_lesson(lesson_id = nil)
    Lesson.find_by(id: lesson_id) || Lesson.first
  end

  def set_youtube
    @youtube = Youtube.friendly.find(params[:id])
  end

  def youtube_params
    params.require(:youtube).permit(:title, :description, :cover, :url, tag_ids: [], author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end
end
