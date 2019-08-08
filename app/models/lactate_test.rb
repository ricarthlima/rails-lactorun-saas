class LactateTest < ApplicationRecord
  belongs_to :user
  has_many :sprint_test
  
  validates :local, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
