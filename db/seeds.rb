mentor = User.find_or_create_by!(email: "mentor@example.com") do |user|
  user.name = "Seed Mentor"
  user.role = :mentor
end

learner = User.find_or_create_by!(email: "learner@example.com") do |user|
  user.name = "Seed Learner"
  user.role = :learner
end

Verification.find_or_create_by!(
  mentor: mentor,
  learner: learner,
  skill_name: "Ruby on Rails"
) do |verification|
  verification.metadata = { evidence_url: "https://github.com/example/rails-project" }
end

Verification.find_or_create_by!(
  mentor: mentor,
  learner: learner,
  skill_name: "TypeScript"
) do |verification|
  verification.metadata = { evidence_url: "https://github.com/example/ts-project" }
end

Verification.find_or_create_by!(
  mentor: mentor,
  learner: learner,
  skill_name: "System Design"
) do |verification|
  verification.metadata = { evidence_url: "https://github.com/example/system-design-notes" }
end
