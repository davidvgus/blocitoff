class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    todos_path
  end

end
