class AddDefaultHolidayToShift < ActiveRecord::Migration[6.1]
  def change
    change_column :shifts, :holiday, :boolean, :default => false
  end
end
