class EventsController < ApplicationController
  
  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    set_meta_tags title: "Events, hackathons and meetups", description: "Events, hackathons and meetups are all excellent opportunities to network and learn new skills.", keywords: "Event, Ruby, Ruby on Rails, best events about programming, hackaton, conference, meetup"
 
    @events = Event.all.order created_at: :desc
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.friendly.find(params[:id])

    set_meta_tags title: "event #{@event.title}", description: "#{@event.title}. #{@event.description}", keywords: "#{@event.title}, event, Ruby, Ruby on Rails"
  end

  def edit
  end

  def update
    if @event.update event_params
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to event_path
  end

  private
  
  def set_event 
    @event = Event.friendly.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :url, :active)
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end
end
