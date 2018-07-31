class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.length_name}
  VALID_EMAIL_REGEX = Settings.email_regex
  validates :email, presence: true, length: {maximum: Settings.length_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.pw_min}
  has_secure_password
end
