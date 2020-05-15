require "rails_helper"

RSpec.describe "User can add contestant to project" do
  it "can fill out form and add contestant" do
    challenge = Challenge.create(theme: "Disney", project_budget: "2000")
    project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge.id)
    moana = Contestant.create(name: "Moana", age: "18", hometown: "Athens", years_of_experience: "3")
    ralphie = Contestant.create(name: "Ralphie", age: "34", hometown: "Brooklyn", years_of_experience: "10")
    ContestantProject.create(contestant_id: moana.id, project_id: project1.id)
    ContestantProject.create(contestant_id: ralphie.id, project_id: project1.id)

      visit "/projects/#{project1.id}"
      click_on "Add Contestant To Project"
      expect(current_path).to eq("/projects/#{project1.id}/contestants/new")

      fill_in :name, with: "Pony"
      fill_in :age, with: "25"
      fill_in :hometown, with: "Seoul"
      fill_in :years_of_experience, with: "6"

      click_on "Submit"

      expect(current_path).to eq("/projects/#{project1.id}")
      expect(page).to have_content("Pony")
      expect(page).to have_content("Number of Contestants: 3")
  end
end





# User Story Extension 2 - Adding a contestant to a project
# ​
# As a visitor,
# When I visit a project's show page
# I see a form to add a contestant to this project
# When I fill out a field with an existing contestants id
# And hit "Add Contestant To Project"
# I'm taken back to the project's show page
# And I see that the number of contestants has increased by 1
# And when I visit the contestants index page  X
# I see that project listed under that contestant's name X
