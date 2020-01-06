# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role                   :integer          default("editor")
#  second_name            :string(255)
#  sign_in_count          :integer          default(0), not null
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_role                  (role)
#

class User < ApplicationRecord
  validates :username, :first_name, :second_name, :email, presence: true

  has_one_attached :avatar
  has_many :publishables

  enum role: Role::ROLES

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def ID
    self.id.to_s.rjust(5, '0')
  end

  def self.search_by_role(role)
    if role.blank?
      User.all
    else
      User.where(role: role)
    end
  end

  def self.generate_password 
    token = SecureRandom.urlsafe_base64
    self.password = token
  end

end
