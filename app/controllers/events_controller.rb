class EventsController < ApplicationController
  def show
    @artist = Artist.find(params[:artist_id])
    @event = Event.find(params[:id])

  end

  def new
    @artist = Artist.find(params[:artist_id])
    @event = Event.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @event = Event.new(events_params)
    @event.user_id = current_user.id
    @event.status = "pending"
    @event.artist = @artist
      if @event.save!
        redirect_to artist_event_path(@artist, @event)
      else
        render :new
      end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(events_params)
      if @event.save!
        redirect_to artist_event_path(@artist, @event)
      else
        render :edit
      end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @event = Event.find(params[:id])
    @event.destroy
  end

  def confirm
    @event = Event.find(params[:event_id])
    @artist = @event.artist
    @event.status = "confirmed"
    @event.save!
    redirect_to artist_event_path(@artist, @event)
  end

  def cancel
    @event = Event.find(params[:event_id])
    @artist = @event.artist
    @event.status = "canceled"
    @event.save!
    redirect_to artist_event_path(@artist, @event)
  end

private

def events_params
  params.require(:event).permit(:name, :description, :location, :status, :date, :event_type)
end

end
