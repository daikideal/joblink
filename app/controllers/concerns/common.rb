module Common
  extend ActiveSupport::Concern

  def profile_exists_already
    return redirect_to root_url, alert: '操作が無効です' unless current_user.profile.nil?
  end

  def profile_require_correct_user
    if job_offerer_signed_in?
      @profile = JobOffererProfile.find(params[:job_offerer_id])
      return unless @profile.job_offerer != current_job_offerer

      redirect_back(fallback_location: root_path, alert: '権限がありません')
    elsif job_seeker_signed_in?
      @profile = JobSeekerProfile.find(params[:job_seeker_id])
      return unless @profile.job_seeker != current_job_seeker

      redirect_back(fallback_location: root_path, alert: '権限がありません')
    end
  end
end
