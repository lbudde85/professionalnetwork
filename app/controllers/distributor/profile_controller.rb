class Distributor::ProfileController < Distributor::DistributorController
  before_action :load_distributor_profile

  def edit
  end

  def update
    if @distributor_profile.update(distributor_profile_params)
      redirect_to distributor_profile_url
    else
      render 'edit'
    end
  end

  private

  def load_distributor_profile
    @distributor_profile = ContractorProfile.find_by(user: current_user)
  end

  def distributor_profile_params
    params.require(:contractor_profile).permit(
      :description,
      :logo,
      :contact_person,
      :contact_position,
      :contact_email,
      :homepage_url,
      :city,
      :street,
      :phone
    )
  end
end
