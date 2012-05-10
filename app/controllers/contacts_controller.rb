# encoding: utf-8

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      ContactsMailer.contact(current_user, @contact).deliver
      redirect_to(new_contact_path, :notice => "¡Gracias por su mensaje! En breve nos pondremos en contacto con usted")
    else
      flash.now.alert = "Rellene todos los campos, por favor"
      render :new
    end
  end
end
