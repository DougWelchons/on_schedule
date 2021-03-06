require 'rails_helper'

RSpec.describe "Project New Page" do
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

    describe "When I visit the project new page" do
      describe "Happy Path" do
        it "shows a form to create a new project" do
          visit new_company_project_path(@company)

          expect(page).to have_field(:name)
          expect(page).to have_field(:start_date)
          expect(page).to have_field(:end_date)
          expect(page).to have_button("Create Project")
        end

        it "creates a new project and redirects to the project show page" do
          visit new_company_project_path(@company)

          fill_in :name, with: "New Project"
          fill_in :start_date, with: "31/3/2022"
          fill_in :end_date, with: "5/6/2023"
          click_button "Create Project"

          project = Project.find_by(name: "New Project")

          expect(Project.all.last.name).to eq("New Project")
          expect(Project.all.last.company_id).to eq(@company.id)
          expect(current_path). to eq(company_project_path(@company, project))
        end

        it "creates a new admin project_user object for the current user" do
          visit new_company_project_path(@company)

          fill_in :name, with: "New Project"
          fill_in :start_date, with: "31/3/2022"
          fill_in :end_date, with: "5/6/2023"
          click_button "Create Project"

          project = Project.find_by(name: "New Project")

          expect(UserProject.find_by(user_id: @user.id).project_id).to eq(project.id)
          expect(UserProject.find_by(user_id: @user.id).admin?).to eq(true)
        end
      end

      describe "Sad path and edge case" do
        it "returns an error if the project is not created properlly" do
          visit new_company_project_path(@company)

          fill_in :name, with: "New Project"
          fill_in :end_date, with: "5/6/2023"
          click_button "Create Project"

          expect(page).to have_content("Unable to create project")
        end
      end
    end
  end

  describe "As a visiter" do
    describe "when I visit the new project page" do
      it "redirects me to the home page with a flash message" do
        visit new_company_project_path(@company)

        expect(current_path).to eq("/")
        expect(page).to have_content("You must be logged in to view this page")
      end
    end
  end
end
