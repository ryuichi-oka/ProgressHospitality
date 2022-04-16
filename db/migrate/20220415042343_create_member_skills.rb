class CreateMemberSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :member_skills do |t|

      t.integer :member_id
      t.integer :skill_id
      t.boolean :is_acquire, null: false, default: false

      t.timestamps
    end
  end
end
