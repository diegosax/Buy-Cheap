class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    puts "CHAMOU O METODO CORRETAMENTE!!!!"
    sign_in resource
    products_path
  end
end