class CreateGroupMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :group_messages do |t|

      t.integer :group_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
