class AddMonthToShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :month, :date
  end
end
