require 'rails_helper'

RSpec.describe ProjectUser, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :project }
  end
end
