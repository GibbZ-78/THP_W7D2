class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :event

  after_create :attendee_send
  after_create :promoter_send

  def attendee_send
    puts "*** Participant: #{self.attendee.first_name} #{self.attendee.last_name} - Evénement: #{self.event.title} ***"
    UserMailer.register_email(self.attendee, self.event).deliver_now
  end

  def promoter_send
    # puts "*** Promoteur: #{self.event.promoter.first_name} #{self.promoter.last_name} - Participant: #{self.attendee.first_name} #{self.attendee.last_name} - Evénement: #{self.event.title} ***"
    UserMailer.new_registration_email(self.event.promoter, self.attendee, self.event).deliver_now
  end

end
