class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :phonenumber, presence: true
  validates :password_digest, presence: true
  has_many :labels, dependent: :destroy
  def self.admins
   @users = User.all
   @admins = 0
   @users.each do |user|
     if user.user_type == "admin"
       @admins += 1
     end
   end
   return @admins
 end
end
