class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'A new event was created'
      redirect_to events_path
    else
      render :new
    end
  end

  private

    def event_params
      params.require(:event).permit(:detail, :location, :date, :description)
    end
end
