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
    # use build method and have the creator's id prepopulated
  end

  private

    def event_params
      params.require(:event).permit(:detail, :location, :date, :description)
    end
end
