class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      redirect_to authors_path
    else
      render :new
    end
  end

  def show
    @book = Book.joins(:authors).where(authors: { id: @author })
    @course = Course.joins(:authors).where(authors: { id: @author })
  end

  def edit
  end

  def update
    if @author.update author_params
      redirect_to author_path
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :content, :twitterUrl, :siteUrl, :githubUrl, )
  end
end
