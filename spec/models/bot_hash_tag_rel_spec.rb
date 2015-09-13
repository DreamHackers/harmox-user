# == Schema Information
#
# Table name: bot_hash_tag_rels
#
#  id          :integer          not null, primary key
#  bot_id      :integer
#  hash_tag_id :integer
#  deleted     :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe BotHashTagRel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
