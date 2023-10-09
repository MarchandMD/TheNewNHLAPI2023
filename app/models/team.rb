class Team < ApplicationRecord
  scope :active, -> { where(active: true).pluck("full_name") }
end
