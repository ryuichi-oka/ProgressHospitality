class AddShiftEndToShift < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :shift_end, :datetime
  end
end
