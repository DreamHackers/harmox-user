# == Schema Information
#
# Table name: realtime_bot_hash_tag_trackings
#
#  id         :integer          not null, primary key
#  bot_id     :integer          not null
#  bot_type   :integer
#  content    :text
#  deleted    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RealtimeBotHashTagTracking < ActiveRecord::Base
  belongs_to :bots
end
