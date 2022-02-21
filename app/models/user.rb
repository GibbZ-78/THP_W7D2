class User < ApplicationRecord
  has_many :attendances, foreign_key: 'attendee_id' #, dependent: :destroy
  has_many :events, through: :attendances
  has_many :promoted_events, foreign_key: 'promoter_id', class_name: "Event"
end
