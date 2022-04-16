class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :group_message_id
      t.integer :member_id
      t.text :comment

      t.timestamps
    end
  end
end
