require "rails_helper"

RSpec.describe "Contestant Index" do
  it "can show list of contestants and projects they've been to" do
    challenge1 = Challenge.create(theme: "Disney", project_budget: "2000")
    challenge2 = Challenge.create(theme: "Fantasy", project_budget: "1500")
    project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge1.id)
    project2 = Project.create(name: "Under the Seas", material: "Cotton", challenge_id: challenge1.id)
    project3 = Project.create(name: "You Know Nothing", material: "Polyester", challenge_id: challenge2.id)
    moana = Contestant.create(name: "Moana", age: "18", hometown: "Athens", years_of_experience: "3")
    ralphie = Contestant.create(name: "Ralphie", age: "34", hometown: "Brooklyn", years_of_experience: "10")
    ContestantProject.create(contestant_id: moana.id, project_id: project2.id)
    ContestantProject.create(contestant_id: ralphie.id, project_id: project1.id)
    ContestantProject.create(contestant_id: moana.id, project_id: project3.id)

    visit '/contestants'

    within ".contestant-#{moana.id}" do
      expect(page).to have_content(moana.name)
      expect(page).to have_content(project2.name)
      expect(page).to have_content(project3.name)
    end

    within ".contestant-#{ralphie.id}" do
      expect(page).to have_content(ralphie.name)
      expect(page).to have_content(project1.name)
    end
  end
end
