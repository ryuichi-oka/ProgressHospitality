class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|

      t.integer :group_message_id
      t.integer :member_id

      t.timestamps
    end
  end
end
