class User < ActiveRecord::Base
  RoleEmployee, RoleManager = 1, 2
  attr_accessor :password, :password_confirmation

  has_many :notifications

  before_create :encrypt_password_and_set_token

  validates :account, presence: true, length: { maximum: 32 }
  validates :password, presence: true, length: { maximum: 50 }, on: :create
  validates :name, presence: true, length: { maximum: 50 }
  validates :role, presence: true

  def encrypt_password_and_set_token
    self.hashed_password = Digest::MD5.hexdigest(self.password)
    self.token = SecureRandom.urlsafe_base64
  end

  def authenticate password
    self.hashed_password == Digest::MD5.hexdigest(password) ? self : nil
  end

  def update_password password
    self.update(hashed_password: Digest::MD5.hexdigest(password))
  end
end
