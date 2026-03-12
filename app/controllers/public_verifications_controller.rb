class PublicVerificationsController < ActionController::Base
  layout "public"

  def show
    @verification = Verification.find_by(verification_hash: params[:hash])

    unless @verification
      render "credential_not_found", status: :not_found
    end
  end
end
