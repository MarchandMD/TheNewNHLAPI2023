class AddTeamsToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_reference :players, :team, null: false, foreign_key: true
  end
end
