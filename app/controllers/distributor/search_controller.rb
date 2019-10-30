class Distributor::SearchController < Distributor::DistributorController
  def index
    if params.has_key?(:query)
      @job_posts = JobPost.search(params[:query])
    else
      @job_posts = JobPost.all
    end
  end
end
