class User < ApplicationRecord
  belongs_to :company
  has_many :user_projects
  has_many :projects, through: :user_projects

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
end
