class Project < ApplicationRecord
  belongs_to :company
  has_many :user_projects
  has_many :users, through: :user_projects

  # validates_presence_of :start_date, :end_date, :company_id
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :company_id, presence: true
end
