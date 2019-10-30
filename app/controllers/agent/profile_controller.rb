class Agent::ProfileController < Agent::AgentController
  before_action :load_agent_profile

  def edit
  end

  def update
    if @agent_profile.update(agent_profile_params)
      redirect_to agent_profile_url
    else
      render 'edit'
    end
  end

  private

  def load_agent_profile
    @agent_profile = ContractorProfile.find_by(user: current_user)
  end

  def agent_profile_params
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
