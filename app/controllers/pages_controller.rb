class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
         sql_query = " \
           artists.name @@ :query \
           OR artists.genre @@ :query \
           OR artists.location @@ :query \
        "
        sql_query += "OR artists.price = #{params[:query].to_i}"

      @artists = Artist.where(sql_query, query: "%#{params[:query]}%")
    else
      @artists = Artist.last(6)
    end
  end

  def user_profile
      @user = current_user
      @events = @user.events
  end
end
