# frozen_string_literal: true

class JobOfferers::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  def after_confirmation_path_for(_resource_name, resource)
    # super(resource_name, resource)
    sign_in(resource)
    if current_job_offerer.profile.blank?
      flash[:notice] = 'メールアドレスが認証されました。続いてプロフィールを登録してください'
      new_job_offerer_profile_path(resource)
    else
      flash[:notice] = 'メールアドレスが認証されました'
      job_offerer_path(resource)
    end
  end
end
