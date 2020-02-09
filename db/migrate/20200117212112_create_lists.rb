class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.belongs_to :user
      t.string :name
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
  end
end
