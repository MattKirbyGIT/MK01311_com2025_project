class HomeController < ApplicationController
  def index
  end

  def contact
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]
    
    if email.blank?
      flash[:alert] = t('home.mailer.no_email')
    
    else# Send an email
      flash[:notice] = t('home.mailer.email_sent')
    end
    redirect_to root_path
  end
end
