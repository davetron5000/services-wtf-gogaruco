class NewPersonEvent
  include ResqueRetryOTron7000
  def self.perform(id)
   
    person = Person.find_by_id(id)
    retry_on(-> { person.nil? }) do 








      UserMailer.send_welcome_email(person)
    end
  end
end
