#project model
class Project < ApplicationRecord
  # belongs_to :user
  
  has_many :bugs, dependent: :destroy
  has_many :project_users
  has_many :users, through: :project_users
  
  validates :name, presence: true
  validates :description, presence: true
end
