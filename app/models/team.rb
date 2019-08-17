class Team < ApplicationRecord
  belongs_to :user
  
  has_many :team_runner
  has_many :team_comanager
end
