class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|

      t.integer :group_id
      t.date :date, null: false
      t.text :event

      t.timestamps
    end
  end
end
