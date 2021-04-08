FactoryBot.define do
  factory :project_user do
    project { nil }
    user { nil }
    user_level { 1 }
  end
end
