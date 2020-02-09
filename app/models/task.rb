class Task < ApplicationRecord
  belongs_to :list

  validates :name, :est_time, presence: true
end
