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

require 'rails_helper'

RSpec.describe HashTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
