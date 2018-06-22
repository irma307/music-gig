class ReviewsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @event = Event.find(params[:event_id])
    @review = Review.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.event = @event
    if @review.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
