class NewPersonEvent

  def self.perform(id)

    person = Person.find_by_id(id)








      UserMailer.send_welcome_email(person)

  end
end
