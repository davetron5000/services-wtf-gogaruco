class NewPersonEvent
  include ResqueRetryOTron

  def self.perform(id)
    person = Person.find_by_id(id)
    retry_on(:times => 5,
             :when  => lambda { person.nil? }) do
      MailerService.mail(:send_welcome_email,person)
    end
  end
end
