class Brand::SearchController < Brand::BrandController
  def index
    if params.has_key?(:query)
      @contractors = ContractorProfile.search(params[:query])
    else
      @contractors = ContractorProfile.all
    end
  end
end
