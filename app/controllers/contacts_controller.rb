# encoding: utf-8

class ContactsController < ApplicationController
  before_action :check_for_mobile

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      ContactsMailer.contact(current_user, @contact).deliver
      redirect_to(new_contact_path, :notice => "¡Gracias por su mensaje! En breve nos pondremos en contacto con usted")
    else
      flash.now.alert = "Por favor, rellene todos los campos"
      render :new
    end
  end
end
