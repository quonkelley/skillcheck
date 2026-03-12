class Api::V1::VerificationsController < ApplicationController
  def show
    verification = Verification.find_by(verification_hash: params[:hash])

    if verification
      render json: {
        skill_name: verification.skill_name,
        mentor_name: verification.mentor.name,
        learner_name: verification.learner.name,
        created_at: verification.created_at,
        metadata: verification.metadata
      }, status: :ok
    else
      render json: { error: "Verification not found" }, status: :not_found
    end
  end
end
