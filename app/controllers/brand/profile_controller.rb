class Brand::ProfileController < Brand::BrandController
  before_action :load_brand_profile

  def edit
  end

  def update
    if @brand_profile.update(brand_profile_params)
      redirect_to brand_profile_url
    else
      render 'edit'
    end
  end

  private

  def load_brand_profile
    @brand_profile = BrandProfile.find_by(user: current_user)
  end

  def brand_profile_params
    params.require(:brand_profile).permit(
      :description,
      :category_id,
      :logo,
      :product_info,
      :homepage_url,
      :city,
      :street,
      :phone
    )
  end
end
