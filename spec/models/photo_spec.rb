# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

require 'rails_helper'

RSpec.describe Photo, type: :model do
  subject { build :photo }
  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user) }
end
