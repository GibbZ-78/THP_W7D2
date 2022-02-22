class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :event

  after_create :attendee_send
  after_create :promoter_send

  def attendee_send
    UserMailer.register_email(self.attendee, self).deliver_now
  end

  def promoter_send
    UserMailer.new_registration_email(self.event.promoter, self.attendee, self).deliver_now
  end

end
