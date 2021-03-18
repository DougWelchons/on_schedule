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

      click_button("Add User")

      expect(current_path).to eq(new_company_user_path(@company))
    end
  end

  describe "When I visit the users new page it " do
    it "shows a form to create a new user" do
      visit new_company_user_path(@company)

      within(".form") do
        expect(page).to have_field(:first_name)
        expect(page).to have_field(:last_name)
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
      end
    end
  end
end
