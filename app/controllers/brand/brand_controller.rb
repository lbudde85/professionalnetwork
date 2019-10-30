class Brand::BrandController < ApplicationController
  before_action :authenticate_brand!

  layout 'brand'
end
