require "rails_helper"

RSpec.describe "Api::V1::Verifications", type: :request do
  let(:mentor)  { User.create!(email: "mentor@example.com", name: "Mentor", role: :mentor) }
  let(:learner) { User.create!(email: "learner@example.com", name: "Learner", role: :learner) }

  describe "GET /api/v1/verifications/:hash" do
    context "when the hash is valid" do
      it "returns 200 and the credential details" do
        verification = Verification.create!(
          mentor: mentor,
          learner: learner,
          skill_name: "Ruby",
          metadata: { evidence_url: "https://example.com/evidence" }
        )

        get "/api/v1/verifications/#{verification.verification_hash}"

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body)
        expect(json["skill_name"]).to eq("Ruby")
        expect(json["mentor_name"]).to eq("Mentor")
        expect(json["learner_name"]).to eq("Learner")
        expect(json["created_at"]).to be_present
        expect(json["metadata"]).to include("evidence_url" => "https://example.com/evidence")
      end
    end

    context "when the hash is invalid" do
      it "returns 404" do
        get "/api/v1/verifications/nonexistenthash"

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
