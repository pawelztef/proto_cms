class User < ApplicationRecord
  validates :username, :first_name, :second_name, :email, presence: true
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


  def ID
    self.id.to_s.rjust(5, '0')
  end


  # TODO add button to form new 
  def self.generate_password 
    token = SecureRandom.urlsafe_base64
    self.password = token
  end

end
