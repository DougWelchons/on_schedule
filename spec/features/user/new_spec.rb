require 'rails_helper'

RSpec.describe "Creating a new user: " do
  before :each do
    @company = Company.create!(name: "Company")
    @user = @company.users.create!(first_name:"First", last_name: "Last", email: "email@domain.com", password: "Password1")
  end

  describe "as a logged in user" do
    before :each do
      visit login_path
      fill_in :email, with: "#{@user.email}"
      fill_in :password, with: "#{@user.password}"
      click_button("Login")
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
          expect(page).to have_button("Add User")
        end
      end

      it "creates a new user when the Add user button is clicked" do
        first_name = "First"
        last_name = "Last"
        email = "new_email@domain.com"
        password = "Password1!"

        visit new_company_user_path(@company)
        fill_in :first_name, with: first_name
        fill_in :last_name, with: last_name
        fill_in :email, with: email
        fill_in :password, with: password
        click_button("Add User")

        expect(current_path).to eq(company_path(@company))

        expect(page).to have_content("New user created successfully.")

        within(".users") do
          expect(page).to have_content("#{last_name}, #{first_name}")
        end
      end
    end
  end
end
