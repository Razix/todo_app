class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :phone, :current_password
  attr_accessor :current_password
  has_many :todos

  validates :username, presence: true, length: { minimum: 6, maximum: 30 }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { maximum: 11 }, numericality: { only_integer: true }
end
