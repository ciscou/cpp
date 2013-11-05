class ContactsMailer < ActionMailer::Base

  default :to => "fabrica@ceramicapadilla.es"
  default :bcc => "francismpp@gmail.com"

  def contact(user, contact)
    @contact = contact
    mail(:from => user.email, :subject => "[Contacto Web] #{contact.subject}")
  end

end
