class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.deliver
      flash[:notice] = 'Your message was sent successfully!'
      redirect_to root_path
    else
      flash[:alert] = 'Could not send message'
      render :new, status: :unprocessable_entity
    end
  end

  def sent
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
