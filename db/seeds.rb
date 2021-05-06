User.destroy_all
Company.destroy_all

company1 = Company.create!(id:1, name: "Company 1")
company2 = Company.create!(id:2, name: "Company 2")

user1 = company1.users.create!(id:1, first_name: "First 1", last_name: "Last 1", email: "email1@domain.com", password: "password1")
user2 = company1.users.create!(id:2, first_name: "First 2", last_name: "Last 2", email: "email2@domain.com", password: "password2")
user3 = company1.users.create!(id:3, first_name: "First 3", last_name: "Last 3", email: "email3@domain.com", password: "password3")
user4 = company2.users.create!(id:4, first_name: "First 4", last_name: "Last 4", email: "email4@domain.com", password: "password4")
user5 = company2.users.create!(id:5, first_name: "First 5", last_name: "Last 5", email: "email5@domain.com", password: "password5")
user6 = company1.users.create!(id:6, first_name: "First 6", last_name: "Last 6", email: "email6@domain.com", password: "password6")
