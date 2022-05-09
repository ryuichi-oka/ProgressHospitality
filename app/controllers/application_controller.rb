class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    admin_group_path(group.id)
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_groups_path
    when Member
      member_member_path(current_member.id)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:group_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :objective, :birthday])
  end
end
