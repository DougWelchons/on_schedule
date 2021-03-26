require 'rails_helper'

RSpec.describe "User show Page" do
  before :each do
    @company = Company.create!(name: "Company")
    @user = @company.users.create!(first_name:"First", last_name: "Last", email: "email@domain.com", password: "Password1")
  end

  describe "as a 'logged in' user" do
    before :each do
      visit login_path
      fill_in :email, with: "#{@user.email}"
      fill_in :password, with: "#{@user.password}"
      click_button("Login")
    end

    describe "When I visit the user dashboard it" do
      it "shows a link to create a new project" do
        visit company_user_path(@company, @user)

        expect(page).to have_link("New Project")
      end

      it "redirects to the new project form page" do
        visit company_user_path(@company, @user)

        click_link("New Project")
      end
    end
  end
end
