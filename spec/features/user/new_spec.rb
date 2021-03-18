require 'rails_helper'

RSpec.describe "Creating a new user: " do
  before :each do
    @company = Company.create!(name: "Company 1")
  end

  describe "When I visit a company's home page it " do
    it "has a button to add a user" do
      visit company_path(@company)

      within("header") do
        expect(page).to have_button("Add User")
      end
    end

    it "redirects me to the user new page when I click 'Add user'" do
      visit company_path(@company)

      click_button("Add user")

      expect(current_path).to eq(new_company_user_path(@company))
    end
  end
end
