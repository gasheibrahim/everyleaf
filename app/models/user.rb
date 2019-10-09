class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true
	validates :type, presence: true
end
