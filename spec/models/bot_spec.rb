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

require 'rails_helper'

RSpec.describe Bot, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
