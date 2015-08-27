class HashTag < ActiveRecord::Base
  has_many :bot_hash_tag_rels
  has_many :bots, :through => :bot_hash_tag_rels

    # 論理削除されていないレコードを全取得
    def self.find_by_alive
      HashTag.where(deleted: false)
    end
end
