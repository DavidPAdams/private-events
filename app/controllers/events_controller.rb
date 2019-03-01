class EventsController < ApplicationController
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
    @event = Event.build(event_params)
    if @event.save
      flash[:success] = 'A new event was created'
      redirect_to #'???'
  end

  private

    def event_params
      params.require(:event).permit(:detail, :location, :date, :description)
    end
end
