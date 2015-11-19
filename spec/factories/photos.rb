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

FactoryGirl.define do
  factory :photo do
    name "MyString"
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/sample.jpg')))
    user
  end

end
