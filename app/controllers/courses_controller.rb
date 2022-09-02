class CoursesController < ApplicationController

  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_course, only: %i[show edit update destroy]

  def index
    set_meta_tags title: "#{Course.count} courses about Ruby & Ruby on Rails", description: "The largest collection of courses about Ruby & Ruby on Rails. Find course that will help you learn new versions of Ruby 3, Ruby on Rails 7, Hotwire, TurboFrame, and become a better programmer in general", keywords: 'Course, free cours,  Ruby, Ruby 3, Ruby on Rails 7, Ruby on Rails 6, Hotwire, Turbo Frame, Stimulus, Tailwind with Rails, learn ruby, learn ruby on rails'
    @tags = Tag.all.order(:title)
    @pagy, @courses = pagy(Course.all.order(created_at: :desc))
    @random = Course.where(id: Course.pluck(:id).sample) 
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

  def show
  @course = Course.friendly.find(params[:id])
    @more_courses = Course.where(id: Course.pluck(:id).sample(3)) 
    @random = Course.where(id: Course.pluck(:id).sample) 
  end

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
    @course = Course.friendly.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :cover, :content, :free, :courseSiteTitle, :courseSiteUrl, tag_ids: [], author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end
end
