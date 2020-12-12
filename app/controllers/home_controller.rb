class HomeController < ApplicationController
  #Default index method 
  # GET /
  def index
  end

  # GET /contact
  # Method to show contact view
  def contact
  end

  # Method to handle contact fomr submit
  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]
    
    if email.blank? #If email has no content, flash error alert
      flash[:alert] = t('home.mailer.no_email')
    
    else # Send an email #Flash a sent notice 
      flash[:notice] = t('home.mailer.email_sent')
    end
    redirect_to root_path #Redirect to root 
  end
end
