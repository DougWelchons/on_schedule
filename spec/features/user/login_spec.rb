require 'rails_helper'

RSpec.describe "User Login:" do
  before :each do
    @company = Company.create!(name: "Company")
    @user = @company.users.create!(first_name: "First", last_name: "Last", email: "email@domain.com", password: "Password1!")
  end

  describe "When I visit the welcome page it" do
    it "shows a button to log in" do
      visit root_path

      expect(page).to have_button("Login")
    end
  end
end
