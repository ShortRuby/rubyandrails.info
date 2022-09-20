class Youtubes::LessonsController < ApplicationController
  
  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_youtube
  before_action :set_lesson, only: %i[show edit update destroy]
  
  def index
  @lessons =  @youtube.lessons.order(created_at: :asc)
  end

  def new
    @lesson = @youtube.lessons.build
  end

  def create
    @lesson = @youtube.lessons.build(lesson_params)
    if @lesson.save
      redirect_to [@youtube, @lesson]
    else
      render :new
    end
  end

  def show
    @with_tags = "" 
    @with_authors = ""
    @with_related = ""
    @with_lessons = ""
    render layout:"show_page"
  end

  def edit

  end

  def update
    if @lesson.update lesson_params
      redirect_to [@youtube, @lesson] 
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    redirect_to youtubes_path
  end

  private

  def set_youtube
    @youtube = Youtube.friendly.find(params[:youtube_id])
  end

  def set_lesson
    @lesson = @youtube.lessons.friendly.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :url)
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end

end
