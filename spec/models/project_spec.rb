require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "relationships" do
    it { should belong_to :company }
    it { should have_many :user_projects }
    it { should have_many(:users).through(:user_projects) }
  end
end
