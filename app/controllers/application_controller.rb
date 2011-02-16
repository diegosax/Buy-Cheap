class ApplicationController < ActionController::Base
  helper_method :current_cart

  protect_from_forgery

  def after_sign_up_path_for(resource)
    sign_in resource
    customer_path(resource)
  end

  def after_sign_in_path_for(resource_or_scope)
    puts "Entrou no metodo para redirecionamento especifico"
    if resource_or_scope.is_a?(User)
      puts "o resource eh um usuario verificando sessao:"
      if session[:payment_proccess]
        puts "Sessao aceita. redirecionando para new_order_path"
        new_order_path
      else
        puts 'Sessao nao aceita, chamando classe pai'
        super
      end
    else
      puts "resource nao eh um user, chamando classe pai"
      super
    end
  end

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
