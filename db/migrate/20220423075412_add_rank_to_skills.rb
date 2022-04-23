class AddRankToSkills < ActiveRecord::Migration[6.1]
  def change
    add_column :skills, :rank, :integer
  end
end
