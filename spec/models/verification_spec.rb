require "rails_helper"

RSpec.describe Verification, type: :model do
  let(:mentor)  { User.create!(email: "mentor@example.com", name: "Mentor", role: :mentor) }
  let(:learner) { User.create!(email: "learner@example.com", name: "Learner", role: :learner) }

  describe "associations" do
    it "belongs to a mentor and a learner" do
      verification = Verification.create!(mentor: mentor, learner: learner, skill_name: "Ruby")

      expect(verification.mentor).to eq(mentor)
      expect(verification.learner).to eq(learner)
    end
  end

  describe "validations" do
    it "requires a skill_name" do
      verification = Verification.new(mentor: mentor, learner: learner, skill_name: nil)

      expect(verification).not_to be_valid
      expect(verification.errors[:skill_name]).to include("can't be blank")
    end

    it "is invalid if the mentor does not have the mentor role" do
      non_mentor_user = User.create!(email: "not_mentor@example.com", name: "Not Mentor", role: :learner)
      verification = Verification.new(mentor: non_mentor_user, learner: learner, skill_name: "Ruby")

      expect(verification).not_to be_valid
      expect(verification.errors[:mentor]).to include("must have mentor role")
    end
  end

  describe "callbacks" do
    it "generates a verification_hash before creation" do
      verification = Verification.create!(mentor: mentor, learner: learner, skill_name: "Ruby")

      expect(verification.verification_hash).to be_present
    end
  end
end

