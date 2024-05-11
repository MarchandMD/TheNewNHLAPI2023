class AddConferenceToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :conference_name, :string
    add_column :teams, :division_name, :string
  end
end
