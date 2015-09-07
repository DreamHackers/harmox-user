class Schedule < ActiveRecord::Base
  belongs_to :bot
  belongs_to :user
  
  validates :weekday, :inclusion => 0..6

end
