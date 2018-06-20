class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @artists = Artist.last(6)
  end

  def user_profile
      @user = current_user
      @events = @user.events
  end
end
