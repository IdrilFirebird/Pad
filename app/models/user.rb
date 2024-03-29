# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	self.per_page = 3

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
										uniqueness: { case_sensitive: false },
										format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	private

			def create_remember_token
				self.remember_token = SecureRandom.urlsafe_base64
			end

end
