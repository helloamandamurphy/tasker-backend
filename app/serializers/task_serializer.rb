class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :est_time, :start_time, :end_time
end
