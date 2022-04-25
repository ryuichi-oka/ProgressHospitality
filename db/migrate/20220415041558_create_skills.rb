class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|

      t.integer :work_type_id
      t.integer :group_id
      t.string :name, null: false
      t.integer :rank, null: false
      t.text :body, null: false
      t.string :terms, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
