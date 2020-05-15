require "rails_helper"

RSpec.describe "Project Show Page" do
  it "can display projects info and the theme in belongs to" do
    challenge = Challenge.create(theme: "Disney", project_budget: "2000")
    project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge.id)


    visit "/projects/#{project1.id}"
    save_and_open_page
    expect(page).to have_content(project1.name)
    expect(page).to have_content(project1.material)
    expect(page).to have_content(challenge.theme)
  end
end
















# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
