class HomeController < ApplicationController
  def index
    @disable_nav = true;
  end

  def about

  end

  def agency_profile
    @agency = Agency.find(session[:current_agency_id])
  end

  def groupTours
    @tours = Tour.paginate(page: params[:page], per_page: 6)
  end

  def agency_single_tour
    @tour = Tour.find(params[:tour_id])
  end

  def all_agency_tours
    @tours = Tour.where(agency_id: current_agency.id).paginate(page: params[:page], per_page: 6)
  end

  def agency_new_event

  end

  def edit_agency_profile
    @agency = Agency.find(session[:current_agency_id])
  end

  def edit_agency_info
    agency = Agency.find_by_email(session[:current_agency_id])
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
    redirect_to agency_profile_path
  end

  def edit_agency_password
    agency = Agency.find(session[:current_agency_id])
    new_pass = params[:edit_new_password]
    confirm_pass = params[:edit_confirm_password]

    if(!new_pass.eql?"" and !confirm_pass.eql?"")
      if new_pass.eql? confirm_pass
        agency.update(password: new_pass)
      end
    else

    end
    redirect_to root_path
  end

end
