class User < ApplicationRecord
  validates :username, :first_name, :second_name, :email, presence: true

  has_one_attached :avatar

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
      User.find_by(role: role)
    end
  end

  def self.generate_password 
    token = SecureRandom.urlsafe_base64
    self.password = token
  end

end
