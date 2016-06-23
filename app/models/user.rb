class User < ActiveRecord::Base
  validates_confirmation_of :password
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :team, presence: true
  validates :password, presence: true
end
