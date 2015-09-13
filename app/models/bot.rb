# == Schema Information
#
# Table name: bots
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  twitter_name  :string
#  twitter_id    :string           not null
#  access_token  :string
#  access_secret :string
#  deleted       :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Bot < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:twitter]

  belongs_to :user

  has_many :bot_hash_tag_rels
  has_many :hash_tags, :through => :bot_hash_tag_rels, :dependent => :destroy
  has_one :schedule, :dependent => :destroy

  validates :twitter_name, presence: true
  validates :twitter_id, presence: true
  validates :access_token, presence: true
  validates :access_secret, presence: true

  # 論理削除されていないレコードを全取得
  def self.find_by_alive
    Bot.where(deleted: false)
  end
end
