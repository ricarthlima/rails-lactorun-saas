class LactateTest < ApplicationRecord
  belongs_to :user
  has_many :sprint_test
end
