class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 3, allow_nil: true}
  has_many :goals

  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(credentials)
    username = credentials[:username]
    password = credentials[:password]
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.password_digest = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

end
