class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :username, :first_name, :second_name, :email, presence: true

  def ID
    self.id.to_s.rjust(5, '0')
  end
end
