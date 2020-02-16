class User < ApplicationRecord
  has_secure_password
  has_many :lists
  has_many :tasks, through: :lists

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
