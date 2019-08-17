class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lactate_test
  has_many :team
  has_many :team_runner
  has_many :team_comanager
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
