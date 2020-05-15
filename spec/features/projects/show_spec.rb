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

  it "can disply average years of experience" do
    challenge = Challenge.create(theme: "Disney", project_budget: "2000")
    project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge.id)

    moana = Contestant.create(name: "Moana", age: "18", hometown: "Athens", years_of_experience: "3")
    ralphie = Contestant.create(name: "Ralphie", age: "34", hometown: "Brooklyn", years_of_experience: "10")

    ContestantProject.create(contestant_id: moana.id, project_id: project1.id)
    ContestantProject.create(contestant_id: ralphie.id, project_id: project1.id)

    visit "/projects/#{project1.id}"

    expect(page).to have_content("Average Contestant Experience: 6.5 years")
  end

  it "can add contestant with a form" do
    challenge = Challenge.create(theme: "Disney", project_budget: "2000")
    project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge.id)

    visit "/projects/#{project1.id}"
    click_on "Add Contestant To Project"
    expect(current_path).to eq("/projects/#{project1.id}/contestants/new")
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
# And when I visit the contestants index page
# I see that project listed under that contestant's name


# User Story Extension 1 - Average years of experience for contestants by project
# As a visitor,
# When I visit a project's show page
# I see the average years of experience for the contestants that worked on that project
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3
#Average Contestant Experience: 10.25 years)
#

# # As a visitor,
# # When I visit a project's show page ("/projects/:id"),
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

# User Story 1 of 3
# ​
# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
