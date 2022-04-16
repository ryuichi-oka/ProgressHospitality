class CreateWorkTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :work_types do |t|

      t.string :work_type
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
