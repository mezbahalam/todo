class User < ActiveRecord::Base
  has_secure_password


  has_many :todo_lists
  validates :email, presence: true,
            uniqueness: true,
            format: {
                with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }

  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
  end

  def generate_password_reset_token!
    update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
  end
end
