class UserController < ApplicationController

  #######################################################  User Controllers  ################################3


  def customizedTours
    @tours = User_Tour.paginate(page: params[:page], per_page: 6)
  end

  def user_profile
    @user = User.find(session[:current_user_id])
  end


  def user_single_tour
    @tour = User_Tour.find(params[:tour_id])
  end

  def all_user_tours
    @tours = User_Tour.where(user_id: current_user.id).paginate(page: params[:page], per_page: 6)
  end

  def user_new_event

  end

  def add_user_event
    tour = User_Tour.new
    tour.title = params[:title]
    tour.user = User.find(current_user.id)
    tour.departure_date = params[:date]
    tour.duration = params[:days]
    tour.budget = params[:price]
    tour.destination = params[:destination]
    tour.full_plan = params[:full_plan]
    tour.save
    redirect_to all_user_tours_path
  end

  def edit_user_profile
    @user = User.find(session[:current_user_id])
  end

  def edit_user_event
    @tour = User_Tour.find(params[:tour_id])
  end

  def save_edit_user_changes
    tour = User_Tour.find(params[:tour_id])
    tour.title = params[:title]
    tour.user = User.find(current_user.id)
    tour.departure_date = params[:date]
    tour.duration = params[:days]
    tour.budget = params[:price]
    tour.destination = params[:destination]
    tour.full_plan = params[:full_plan]
    tour.save

    redirect_to all_user_tours_path
  end

  def delete_user_tour
    tour = User_Tour.find(params[:tour_id])
    tour.delete
    redirect_to all_user_tours_path
  end

  def edit_user_info
    user = User.find(session[:current_user_id])

    email = user.email
    name = user.full_name

    new_email = params[:edit_email]
    new_name = params[:edit_name]

    if(new_email.eql?"")
      user.update(email: email)
    else
      user.update(email: new_email)
    end
    if(new_name.eql?"")
      user.update(full_name: name)
    else
      user.update(full_name: new_name)
    end

    redirect_to user_profile_path
  end

  def edit_user_password
    user = User.find(session[:current_user_id])
    new_pass = params[:edit_new_password]
    confirm_pass = params[:edit_confirm_password]

    if(!new_pass.eql?"" and !confirm_pass.eql?"")
      if new_pass.eql? confirm_pass
        user.update(password: new_pass)
      end
    else

    end
    redirect_to root_path
  end

end
