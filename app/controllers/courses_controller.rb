class CoursesController < ApplicationController

  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_course, only: %i[show edit update destroy]

  def index
    set_meta_tags noindex
    @tags = Tag.all
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @course.update course_params
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :content, :free, :courseSiteTitle, :courseSiteUrl, tag_ids: [], author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end
end
