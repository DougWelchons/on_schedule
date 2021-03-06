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

  describe "when I visit the login page it" do
    it "has a login form" do
      visit login_path

      within(".form") do
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
        expect(page).to have_button("Login")
      end
    end

    it "logs me in if I have valid info" do
      visit login_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_button("Login")

      expect(current_path).to eq(company_user_path(@user.company, @user))
    end

    it "won't log me in if my password is inncorect" do
      visit login_path

      fill_in :email, with: @user.email
      fill_in :password, with: "WrongPassword"
      click_button("Login")

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Email or Password")
    end
  end
end
