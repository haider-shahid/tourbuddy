class HomeController < ApplicationController
  def index
  end

  def about
  end

  #######################################################  Agency Controllers  ################################3

  def agency_profile
    @agency = Agency.find(session[:current_agency_id])
  end

  def groupTours
    @tours = Tour.order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def agency_single_tour
    @tour = Tour.find(params[:tour_id])
    @comment = Comment.new
  end

  def all_agency_tours
    @tours = Tour.where(agency_id: current_agency.id).order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def agency_new_event
    @tour = Tour.new
  end

  def add_agency_event
    tour = Tour.new(agency_params)
    tour.agency = Agency.find(current_agency.id)
    if tour.save
      tour.image.attach(params[:tour][:image])
      flash[:success] = "Event Successfully created"
      redirect_to groupTours_path
    else
      redirect_to root_path
    end
  end

  def filters
    test = params[:tour_price]
    days = params[:days]
    if(days == "1 Day")
      querey_day = 2
    elsif (days == "Less than 2 Days")
      querey_day = 3
    elsif(days == "Less than 3 Days")
      querey_day = 4
    elsif
      querey_day = 1000000
    end

    if(test == "Less than 10,000")
          @tours = Tour.where("budget < ?",10000).where("duration < ?",querey_day).order("created_at DESC").paginate(page: params[:page], per_page: 6)
    elsif(test == "10,000 to 20,000")
          @tours = Tour.where("budget between ? and ?",10000,20000).where("duration < ?",querey_day).order("created_at DESC").paginate(page: params[:page], per_page: 6)
    elsif(test == "Greater than 20,000")
      @tours = Tour.where("budget > ?",20000).where("duration < ?",querey_day).order("created_at DESC").paginate(page: params[:page], per_page: 6)
    else
      @tours = Tour.where("duration < ?",querey_day).order("created_at DESC").paginate(page: params[:page], per_page: 6)
    end

    # "Less than 10,000", "10,000 to 20,000", "Greater than 20,000"]) %>
    # @tours = Tour.where("budget > ?",5000).order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end
  def agency_params
    params.require(:tour).permit(:title, :departure_date, :duration,:budget,:destination,:full_plan,:image,inclusions_attributes: [:id, :service,:_destroy] )
  end

  def edit_agency_profile
    @agency = Agency.find(session[:current_agency_id])
  end

  def edit_agency_event
    @tour = Tour.find(params[:id])
  end

  def save_edit_agency_changes
    tour = Tour.find(params[:tour][:tour_id])

    if tour.update_attributes(agency_params)
      flash[:success] = "Successfully updated"
      redirect_to all_agency_tours_path
    else
      redirect_to root_path
    end

    # tour.title = params[:title]
    # tour.agency = Agency.find(current_agency.id)
    # tour.departure_date = params[:date]
    # tour.duration = params[:days]
    # tour.budget = params[:price]
    # tour.destination = params[:destination]
    # tour.full_plan = params[:full_plan]
    # tour.save
  end

  def delete_agency_tour
    tour = Tour.find(params[:tour_id])
    tour.image.purge
    tour.destroy
    flash[:warning] = "Successfully deleted"
    redirect_to all_agency_tours_path
  end

  def edit_agency_info
    agency = Agency.find(session[:current_agency_id])
    title = agency.title
    email = agency.email
    num = agency.phone_num
    about = agency.about
    address = agency.address
    new_title = params[:edit_title]
    new_email = params[:edit_email]
    new_num = params[:edit_number]
    new_about = params[:edit_about]
    new_address = params[:edit_address]
    if(new_title.eql?"")
      agency.update(title: title)
    else
      agency.update(title: new_title)
    end
    if(new_email.eql?"")
      agency.update(email: email)
    else
      agency.update(email: new_email)
    end
    if(new_num.eql?"")
      agency.update(phone_num: num)
    else
      agency.update(phone_num: new_num)
    end
    if(new_address.eql?"")
      agency.update(address: address)
    else
      agency.update(address: new_address)
    end
    if(new_about.eql?"")
      agency.update(about: about)
    else
      agency.update(about: new_about)
    end
    flash[:success] = "Successfully updated"
    redirect_to agency_profile_path
  end

  def edit_agency_password
    agency = Agency.find(session[:current_agency_id])
    new_pass = params[:edit_new_password]
    confirm_pass = params[:edit_confirm_password]

    if(!new_pass.eql?"" and !confirm_pass.eql?"")
      if new_pass.eql? confirm_pass
        agency.update(password: new_pass)
        flash[:success] = "Password Updated Successfully"
      end
    else

    end
    redirect_to root_path
  end

  def add_comment
    # render plain: params[:comment][:comment].inspect
    @tour = Tour.find_by(id:params[:comment][:id])
    if session[:current_agency_id].present?
      agency = Agency.find(session[:current_agency_id])
      Comment.create(comment:params[:comment][:comment],tour:@tour,agency_id:agency.id)
    elsif session[:current_user_id].present?
      user = User.find(session[:current_user_id])
      Comment.create(comment:params[:comment][:comment],tour:@tour,user_id:user.id)
    end
    flash[:success]= "Comment Successfully Added"
    redirect_to agency_single_tour_path(:tour_id =>@tour.id)
  end

  def del_comment
    @msg = Comment.find_by(id: params[:comment_id])
    @msg.destroy
    flash[:danger] ="Comment Successfully Deleted"
    redirect_to agency_single_tour_path(:tour_id =>params[:tour_id])
  end

end
