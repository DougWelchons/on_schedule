class UserProject < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum user_level: [:admin]
end
