class AddColumnsToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :team_common_name, :string
    add_column :teams, :team_place_name, :string
    add_column :teams, :franchise_id, :integer
    rename_column :teams, :abbreviation, :tri_code
  end
end
