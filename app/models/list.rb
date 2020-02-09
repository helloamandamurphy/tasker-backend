class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :end_time, presence: true
end
