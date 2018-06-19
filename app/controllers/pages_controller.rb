class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @artists = Artist.last(6)
  end
end
