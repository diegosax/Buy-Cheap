class ApplicationController < ActionController::Base
  protect_from_forgery


  def is_company?
    return current_user.class == Company
  end

  def is_customer?
    return current_user.class == Customer
  end

  def only_companies
    if current_user.class != Company
      flash[:alert] = "Voce nao tem permissao de acessar a parte administrativa"
      redirect_to root_url
    end
  end



  private

  #Metodo que pega o carrinho atual da sessao ou cria um novo e salva na sessao
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
