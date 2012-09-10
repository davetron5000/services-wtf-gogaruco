class NewPersonEvent
  def self.perform(id)
    person = Person.find(id)
    UserMailer.send_welcome_email(person)
  end
end
