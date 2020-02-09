class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :list
      t.string :name
      t.integer :est_time
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
  end
end
