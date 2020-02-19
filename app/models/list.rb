class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :end_time, presence: true

# We'll need a method to find the worktime
#(subtracting the end time from the current time)
# also need to make sure this time is positive
# and not longer than like 12 hours
  def calculate_worktime(list_info)
    time_a = Time.parse(list.end_time)
    time_b = Time.now

    (time_a - time_b)/60
  end
end
