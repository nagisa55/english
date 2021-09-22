class ContactController < ApplicationController
  def index
    @contact = Contact.new
    render :index
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :confirm
    else
      render :index
    end
  end

  def thanks
    @contact = Contact.new(contact_params)
    ContactMailer.send_mail(@contact).deliver
    render :thanks
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
