class CreateSkillDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_details do |t|

      t.integer :skill_id
      t.text :body, null: false

      t.timestamps
    end
  end
end
