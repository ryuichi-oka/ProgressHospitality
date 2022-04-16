class CreateSkillManuals < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_manuals do |t|

      t.integer :skill_id
      t.integer :manual_id

      t.timestamps
    end
  end
end
