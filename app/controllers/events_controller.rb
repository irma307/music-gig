class EventsController < ApplicationController

  def new
    @artist = Artist.find(params[:artist_id])
    @event = Event.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @event = Event.new(events_params)
    @event.user_id = current_user.id
    @event.save!
  end

  def edit
  end

  def update
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @event = Event.find(params[:id])
    @event.destroy
  end

private

def events_params
  params.require(:event).permit(:name, :description, :location, :status, :date, :type)
end

end
