class LandingController < ApplicationController
  def index

    set_meta_tags title: "Books about Ruby & Ruby on Rails" 

    @books = Book.all.limit(2).order(created_at: :desc)
    @courses = Course.all
    @tags = Tag.all
  end
end
