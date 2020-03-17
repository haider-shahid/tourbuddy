class UserController < ApplicationController

  #######################################################  User Controllers  ################################3


  def customizedTours
    @tours = UserTour.order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def user_profile
    @user = User.find(session[:current_user_id])
  end


  def user_single_tour
    begin
      @tour = UserTour.find(params[:tour_id])
      @user_comment = UserComment.new
      if @tour.user_id != current_user.id
        redirect_to all_user_tours_path
      end
    rescue ActiveRecord::RecordNotFound
      # however you want to respond to it
      redirect_to all_user_tours_path
    end
  end

  def all_user_tours
    @tours = UserTour.where(user_id: current_user.id).order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def user_new_event

  end

  def add_user_event
    tour = UserTour.new
    tour.title = params[:title]
    tour.user = User.find(current_user.id)
    tour.departure_date = params[:date]
    tour.duration = params[:days]
    tour.budget = params[:price]
    tour.destination = params[:destination]
    tour.full_plan = params[:full_plan]
    tour.save
    flash[:success] = "Event Successfully added"
    redirect_to all_user_tours_path
  end

  def edit_user_profile
    @user = User.find(session[:current_user_id])
  end

  def edit_user_event
    @tour = UserTour.find(params[:tour_id])
  end

  def save_edit_user_changes
    tour = UserTour.find(params[:tour_id])
    tour.title = params[:title]
    tour.user = User.find(current_user.id)
    tour.departure_date = params[:date]
    tour.duration = params[:days]
    tour.budget = params[:price]
    tour.destination = params[:destination]
    tour.full_plan = params[:full_plan]
    tour.save
    flash[:success] = "Event Successfully updated"
    redirect_to all_user_tours_path
  end

  def delete_user_tour
    tour = UserTour.find(params[:tour_id])
    tour.delete
    flash[:warning] = "Successfully deleted"
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
    flash[:success] = "Successfully updated"
    redirect_to user_profile_path
  end

  def edit_user_password
    user = User.find(session[:current_user_id])
    new_pass = params[:edit_new_password]
    confirm_pass = params[:edit_confirm_password]

    if(!new_pass.eql?"" and !confirm_pass.eql?"")
      if new_pass.eql? confirm_pass
        user.update(password: new_pass)
        flash[:success] = "Password Successfully Updated"
      end
    else

    end
    redirect_to root_path
  end
  def add_user_comment
    # render plain: params.inspect
    @tour = UserTour.find_by(id:params[:user_comment][:id])
    if session[:current_agency_id].present?
      agency = Agency.find(session[:current_agency_id])
      UserComment.create(comment:params[:user_comment][:comment],user_tour:@tour,agency_id:agency.id)
    elsif session[:current_user_id].present?
      user = User.find(session[:current_user_id])
      UserComment.create(comment:params[:user_comment][:comment],user_tour:@tour,user_id:user.id)
    end
    flash[:success]= "Comment Successfully Added"
    redirect_to user_single_tour_path(:tour_id =>@tour.id)
  end

  def del_user_comment
    @msg = UserComment.find_by(id: params[:comment_id])
    @msg.destroy
    flash[:danger] = "Comment Successfully Deleted"
    redirect_to user_single_tour_path(:tour_id =>params[:tour_id])
  end

end
