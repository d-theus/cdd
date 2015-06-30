class ContactsController < ApplicationController
  before_action :authenticate, except: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params.require(:contact).permit(:name, :email, :description))
    if verify_recaptcha(model: @contact, message: 'Invalid captha, please retry')
      if @contact.save
        flash[:notice] = 'Okay, I will contact you'
        ContactMailer.contact_email(@contact).deliver
        redirect_to '/'
      else
        flash[:alert] = 'Something went wrong'
        render :new
      end
    else
      flash[:alert] = 'Please verify you are not a robot'
      render :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def index
    @contacts = Contact.limit(20).order('created_at DESC')
  end

  def authenticate
    if signed_in?
      true
    else
      redirect_to new_admin_session_path
    end
  end
end
