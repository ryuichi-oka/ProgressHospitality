class ChangeShiftColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :shifts, :shift, true
  end
end
