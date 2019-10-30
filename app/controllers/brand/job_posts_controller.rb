class Brand::JobPostsController < Brand::BrandController
  def index
    @job_posts = JobPost.where(user: current_user)
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.new(job_post_params)
    @job_post.user = current_user

    if @job_post.save
      redirect_to brand_jobs_url
    else
      render 'new'
    end
  end

  def destroy
    job_post = JobPost.find(params[:id])
    if job_post && job_post.user == current_user
      job_post.destroy
    end

    redirect_to brand_jobs_url
  end

  private

  def job_post_params
    params.require(:job_post).permit(
      :title,
      :description,
      :skills,
      :experience_level,
      :job_period,
      :qualifications,
      :questions,
      :file_attachment
    )
  end
end
