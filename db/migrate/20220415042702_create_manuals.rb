class CreateManuals < ActiveRecord::Migration[6.1]
  def change
    create_table :manuals do |t|

      t.integer :work_type_id
      t.integer :group_id
      t.string :name
      t.text :body
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
