#encoding: utf-8

class ApplicationController < ActionController::Base
  helper_method :current_cart
  helper_method :current_user
  before_filter :load_categories

  protect_from_forgery


  def load_categories
    @categories = Category.super_categories
  end

  def clear_steps_session
    session[:order_step] = "identification"
    puts "TESTANDO O BEFORE_FILTER, VALOR DA SESSION: #{session[:order_step]}"
  end

  def authenticate_user
    if session[:user_id].nil?
      redirect_to log_in_url, :alert => "Você deve estar autenticado para acessar esta página"
    end
  end
  def authenticate_company
    if session[:company_id].nil?
      redirect_to log_in_url, :alert => "Você deve estar autenticado para acessar esta página"
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    puts "Entrou no metodo para redirecionamento especifico"
    if resource_or_scope.is_a?(Customer)
      puts "o resource eh um usuario verificando sessao:"
      if session[:payment_proccess]
        puts "Sessao aceita. redirecionando para new_order_path"
        new_order_path
      else
        root_url
      end
    else
      admin_root_url
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


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_company
    @current_company ||= User.find(session[:company_id]) if session[:company_id]
  end

end
