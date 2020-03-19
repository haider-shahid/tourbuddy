class FavouritesController < ApplicationController
  def update
    # render plain: params.inspect
    # tour = Tour.find_by_id(params[tour_id])
    fav = Favourite.where(tour:params[:tour] ,user: current_user)
    if fav ==  []
      Favourite.create(tour: Tour.find(params[:tour]), user: current_user)
      @fav_exist = true
    else
      fav.destroy_all
      @fav_exist = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def view_all
    @tours = Tour.where(id: Favourite.where(user: current_user).pluck(:tour_id)).order("created_at DESC").paginate(page: params[:page], per_page: 6)
    if @tours == []
      @heading_to_display = "Nothing to Show :("
    else
      @heading_to_display = "Your Favourite Tours"
    end
  end
end
