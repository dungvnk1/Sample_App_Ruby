class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :name,    presence: true, length: { maximum: Settings.users.max_name_length }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,   presence: true, length: { maximum: Settings.users.max_email_length },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: Settings.users.email_uniqueness
    has_secure_password
    validates :password, presence: true, length: { minimum: Settings.users.password_min_length }
end
