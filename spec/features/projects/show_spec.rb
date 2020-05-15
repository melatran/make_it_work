require "rails_helper"

RSpec.describe "Project Show Page" do
  it "can display projects info and the theme in belongs to" do
    project1 = Project.create(name: "Mulan Warrior", material: "Silk")
    challenge = Challenge.create(theme: "Disney", project_budget: "2000")

    visit '/projects/:id'

    expect(page).to have_content("Mulan Warrrior")
    expect(page).to have_content("Material: Silk")
    expect(page).to have_content("Challenge Theme: Disney")
  end
end
















# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
