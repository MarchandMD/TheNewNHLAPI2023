class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  def defense
    players.where(position: "D")
  end

  def goalies
    players.where(position: "G")
  end

  def forwards
    players.where(position: %w[R L C]).order(:position)
  end
end
