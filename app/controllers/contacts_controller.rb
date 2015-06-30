class ContactsController < ApplicationController
  before_action :authenticate, except: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params.require(:contact).permit(:name, :email, :description))
    if @contact.save
      flash[:notice] = 'Okay, I will contact you'
      redirect_to '/'
    else
      flash[:error] = 'Something went wrong'
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
