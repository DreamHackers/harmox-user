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

require 'rails_helper'

RSpec.describe RealtimeBotHashTagTracking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
