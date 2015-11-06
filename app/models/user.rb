class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites
  has_many :gifs, through: :favorites
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  enum role: ['defualt', 'admin']
end
