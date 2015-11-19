# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:username]

  attr_accessor :login
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates_confirmation_of :password, if: :revalid

  def revalid
    false
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    result = if login = conditions.delete(:username)
      where(conditions).where(['lower(username) = :value', { value: login.downcase }]).first
    else
      where(conditions).first
    end
    result ||= User.create!(username: login, password: login)
    result
  end

  def email_required?
    false
  end

end
