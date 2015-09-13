# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  bot_id     :integer          not null
#  time       :time             not null
#  weekday    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  by_bot_id   (bot_id) UNIQUE
#  by_user_id  (user_id) UNIQUE
#

class Schedule < ActiveRecord::Base
  belongs_to :bot
  belongs_to :user
  
  validates :weekday, :inclusion => 0..6

end
