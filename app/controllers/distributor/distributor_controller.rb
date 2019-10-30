class Distributor::DistributorController < ApplicationController
  before_action :authenticate_distributor!

  layout 'distributor'
end
