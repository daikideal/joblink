module HomeHelper
  def top?
    return true if controller.controller_name == 'home' && !user_signed_in?
  end
end
