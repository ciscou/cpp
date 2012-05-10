class ContactsMailer < ActionMailer::Base

  default :to => "fabrica@ceramicapadilla.es"

  def contact(user, contact)
    @contact = contact
    mail(:from => user.email, :subject => "[Contacto Web] #{contact.subject}")
  end

end
