class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def fav_text
    return @fav_exist? "UnFavourite" : "Favourite"
  end
  helper_method :fav_text
end
