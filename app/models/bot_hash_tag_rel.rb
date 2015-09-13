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

class BotHashTagRel < ActiveRecord::Base
  belongs_to :bot
  belongs_to :hash_tag

  # 論理削除されていないレコードを全取得
  def self.find_by_alive
    BotHashTagRel.where(deleted: false)
  end

  # bot_idとhash_idからレコードを取得
  def self.find_by_bot_id_hash_id(bot_id, hash_tag_id)
    BotHashTagRel.where(bot_id: bot_id, hash_tag_id: hash_tag_id).first
  end
end
