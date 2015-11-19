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

class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :image, :user

  belongs_to :user
end
