require "rails_helper"

RSpec.describe "Project Show Page" do
  it "can display projects info and the theme in belongs to" do
    challenge = Challenge.create(theme: "Disney", project_budget: "2000")
    project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge.id)


    visit "/projects/#{project1.id}"

    expect(page).to have_content(project1.name)
    expect(page).to have_content(project1.material)
    expect(page).to have_content(challenge.theme)
  end

  it "can count number of contestants in a project" do
    challenge = Challenge.create(theme: "Disney", project_budget: "2000")
    project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge.id)

    moana = Contestant.create(name: "Moana", age: "18", hometown: "Athens", years_of_experience: "3")
    ralphie = Contestant.create(name: "Ralphie", age: "34", hometown: "Brooklyn", years_of_experience: "10")

    ContestantProject.create(contestant_id: moana.id, project_id: project1.id)
    ContestantProject.create(contestant_id: ralphie.id, project_id: project1.id)

    visit "/projects/#{project1.id}"

    expect(page).to have_content(project1.name)
    expect(page).to have_content(project1.material)
    expect(page).to have_content(challenge.theme)
    expect(page).to have_content("Number of Contestants: 2")
  end
end







# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)


# User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )
