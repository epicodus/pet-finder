class User < ActiveRecord::Base
  ROLES = %w(admin user guest)
  has_many :pets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role, presence: true, inclusion: { in: ROLES, message: "%{value} is not a valid role"}
end
