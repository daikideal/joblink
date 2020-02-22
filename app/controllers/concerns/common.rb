module Common
  extend ActiveSupport::Concern

  def confirm_profile
    return unless @profile.nil?

    if job_offerer_signed_in?
      redirect_to new_job_offerer_profile_path(@job_offerer)
      flash[:notice] = 'プロフィールの設定が必要です'
    elsif job_seeker_signed_in?
      redirect_to new_job_seeker_profile_path(@job_seeker)
      flash[:notice] = 'プロフィールの設定が必要です'
    end
  end

  def popular_tags
    @tags = ActsAsTaggableOn::Tag.most_used(12)
  end

  def require_admin
    return unless current_user.admin == false

    redirect_back(fallback_location: root_path, alert: '権限がありません')
  end

  def require_profile
    return unless current_user.profile.nil?

    if job_offerer_signed_in?
      redirect_to new_job_offerer_profile_path(current_user)
      flash[:notice] = 'プロフィールの設定が必要です'
    elsif job_seeker_signed_in?
      redirect_to new_job_seeker_profile_path(current_user)
      flash[:notice] = 'プロフィールの設定が必要です'
    end
  end

  def profile_exists_already
    return redirect_to root_url, alert: '操作が無効です' unless current_user.profile.nil?
  end

  def require_correct_user
    if job_offerer_signed_in?
      @job_offerer = JobOfferer.find(params[:job_offerer_id])
      return unless @job_offerer != current_job_offerer

      redirect_back(fallback_location: root_path, alert: '権限がありません')
    elsif job_seeker_signed_in?
      @job_seeker = JobSeeker.find(params[:job_seeker_id])
      return unless @job_seeker != current_job_seeker

      redirect_back(fallback_location: root_path, alert: '権限がありません')
    end
  end

  def searched(profile)
    @q = profile.ransack(params[:q])
    if params[:tag_name]
      profile.tagged_with(params[:tag_name].to_s).active
    else
      @q.result(distinct: true).active
    end
  end
end
