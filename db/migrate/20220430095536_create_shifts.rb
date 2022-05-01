class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.references :member, foreign_key: true
      t.datetime :shift, null: false
      t.boolean :holiday
      t.text :comment
      t.timestamps
    end
  end
end
