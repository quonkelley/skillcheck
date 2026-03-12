class Verification < ApplicationRecord
  belongs_to :mentor, class_name: "User"
  belongs_to :learner, class_name: "User"

  before_create :generate_verification_hash

  validates :skill_name, presence: true
  validate :mentor_must_have_mentor_role

  private

  def generate_verification_hash
    self.verification_hash ||= SecureRandom.hex(16)
  end

  def mentor_must_have_mentor_role
    return if mentor&.mentor?

    errors.add(:mentor, "must have mentor role")
  end
end
