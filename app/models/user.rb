class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings

  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, presence: true
  validates_length_of :password, :minimum => 5

  def self.find_by_email_case_insensitive(email)
    User.where("lower(email) = ?", email.downcase).first
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email_case_insensitive(email.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
