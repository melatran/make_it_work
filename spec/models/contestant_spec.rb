require 'rails_helper'


RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "methods" do
    it ".average_years_experience" do
      challenge = Challenge.create(theme: "Disney", project_budget: "2000")
      project1 = Project.create(name: "Mulan Warrior", material: "Silk", challenge_id: challenge.id)

      moana = project1.contestants.create(name: "Moana", age: "18", hometown: "Athens", years_of_experience: 3)
      ralphie = project1.contestants.create(name: "Ralphie", age: "34", hometown: "Brooklyn", years_of_experience: 10)

      expect(Contestant.average_years_experience).to eq(6.5)
    end
  end
end
