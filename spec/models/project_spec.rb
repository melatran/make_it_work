require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "methods" do
    it "can .total_contestants" do
    challenge = Challenge.create(theme: "Disney", project_budget: "2000")
    project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge.id)

    moana = project1.contestants.create(name: "Moana", age: "18", hometown: "Athens", years_of_experience: "3")
    ralphie = project1.contestants.create(name: "Ralphie", age: "34", hometown: "Brooklyn", years_of_experience: "10")

    expect(project1.total_contestants).to eq(2)
    end
  end
end
