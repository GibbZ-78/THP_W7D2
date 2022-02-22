class User < ApplicationRecord
  
  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_many :attendances, foreign_key: 'attendee_id', dependent: :destroy
  has_many :events, through: :attendances
  has_many :promoted_events, foreign_key: 'promoter_id', class_name: "Event"

private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
