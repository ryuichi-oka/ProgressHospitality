class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|

      t.integer :admin_id
      t.string :shop_name

      t.timestamps
    end
  end
end
