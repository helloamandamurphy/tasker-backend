class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_time, :end_time

  has_many :tasks
end
