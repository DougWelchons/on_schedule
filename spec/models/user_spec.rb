require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should belong_to :company }
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should have_many :user_projects }
    it { should have_many(:projects).through(:user_projects) }
  end
end
