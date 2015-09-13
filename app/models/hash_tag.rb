# == Schema Information
#
# Table name: hash_tags
#
#  id         :integer          not null, primary key
#  hash_tag   :string           not null
#  deleted    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HashTag < ActiveRecord::Base
  has_many :bot_hash_tag_rels
  has_many :bots, :through => :bot_hash_tag_rels, :dependent => :destroy

    # 論理削除されていないレコードを全取得
    def self.find_by_alive
      HashTag.where(deleted: false)
    end
end
