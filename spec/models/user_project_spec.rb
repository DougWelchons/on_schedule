require 'rails_helper'

RSpec.describe UserProject, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :project }
  end
end
