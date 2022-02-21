class Event < ApplicationRecord
  has_many :attendances, foreign_key: "event_id"  #, dependent: :destroy
  has_many :attendees, class_name: "User", through: :attendances
  belongs_to :promoter, class_name: "User"

  # # VALIDATIONS
  # # Start_date
  # # Mandatory + Forbidden to create or update a past event
  # # Question: is is useful to add "on: create / dupdate" here ? Is it possible to have both in 1 line only?
  # @my_date = Date.today
  # validates :start_date, presence: true, comparison: { greater_than_or_equal_to: @my_date} 

  # # Duration
  # # Mandatory + Must be a multiple of 5 + Must be strictmy greater than 0
  # validates :duration, presence: true, 
  #                      if: :div_by_5_and_pos?

  # # Title
  # # Mandatory + Must be between 5 and 140 characters long
  # validates :title, presence: true, 
  #                   length: { minimum: 5, maximum: 140 }
  
  # # Description
  # # Mandatory + Must be between 5 and 140 characters long
  # validates :description, presence: true, 
  #                         length: { minimum: 20, maximum: 2000 }

  # # Price
  # # Mandatory + Must be an Integer + Value must be between 1 and 1000
  # validates :price, presence: true, 
  #                   numericality: { only_integer: true }, 
  #                   comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

  # # Location
  # # Mandatory
  # validates :location, presence: true 

  private

  def div_by_5_and_pos?
    puts "  > Testing duration is multiple of 5 and greater than 0"
    ((self.duration%5 == 0) && (self.duration > 0))
  end

end
