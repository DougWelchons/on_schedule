require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "relationships" do
    it { should belong_to :company }
    it { should have_many :user_projects }
    it { should have_many(:users).through(:user_projects) }
  end

  describe "validations" do
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
    it { should validate_presence_of :company_id }
  end
end
