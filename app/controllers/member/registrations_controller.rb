# frozen_string_literal: true

class Member::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  # GET /resource/sign_up
  def new
    @group_id = params[:group_id]
    @group = Group.find_by(id: @group_id)
    super
  end

  # POST /resource
  def create
    member = Member.new(sign_up_params)
    #@group_id = member.group_id
    @group_id = sign_up_params[:group_id]
    if member.valid?
      super
    else
      flash[:error] = " * は必須項目です"
      redirect_to new_member_registration_path(group_id: @group_id)
    end
  end

  def after_sign_in_path_for(resource)
    admin_group_path(@group_id, group_id: @group_id)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end



  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # def current_member_is_admin?
  #   member_signed_in? && current_member.has_role?(:admin)
  # end

  # def sign_up(resource_name, resource)
  #   if !current_member_is_admin
  #     sign_in(resource_name, resource)
  #   end
  # end
end
