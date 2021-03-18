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

    it "takes me to a login page when I click the 'login' button" do
      visit root_path

      click_button("Login")

      expect(current_path).to eq(login_path)
    end
  end
end
