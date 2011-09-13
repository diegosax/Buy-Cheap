class OrdersController < ApplicationController
  before_filter :authenticate_user, :only => [:direct_charge, :manual_charge, :invoice, :index, :show, :destroy]
  skip_before_filter :verify_authenticity_token, :only=>[:notification,:confirm]

  def notification
    notes = Moip.notification(params)
    puts notes.inspect
  end

  #Metodo de pagamento pelo moip
  def direct_charge
    @invoice = processar_pedido

    if @invoice.save
      puts "Consegui Salvar, destroindo carrinho e sessao"
      cart = Cart.find(session[:cart_id])
      if cart && !cart.empty?

        #Alterando o STOCK de cada produto
        cart.line_items.each do |item|
          puts "TENTANDO ALTERAR O STOCK "
          puts item.inspect
          p = Product.find(item.product_id)
          puts p.inspect
          p.stock -= item.quantity
          p.save
          #p.update_stock(item.quantity)
        end

        cart.clear_line_items
        cart.save
        Cart.destroy(session[:cart_id])
      end
      session[:shipping_address_id] = nil
      session[:cart_id] = nil
    else
      flash[:alert] = "Houve um erro ao tentar salvar seu pedido"
      redirect_to root_url
    end
    response = Moip.authorize(@invoice,current_user)
    redirect_to Moip.charge_url(response["Token"])
  end


  def manual_charge
    @response = Moip.authorize(:reason=>"Mensalidade",:id=>"Pag#{rand(1000)}",:value=>1)
  end

  def confirm
    return unless request.post?

    pagseguro_notification do |notification|
      # Aqui você deve verificar se o pedido possui os mesmos produtos
      # que você cadastrou. O produto só deve ser liberado caso o status
      # do pedido seja "completed" ou "approved"
      puts "RECEBEU NOTIFICACAO!!!!!!!!!!"
      puts "VERIFICANDO STATUS DO PEDIDO: #{notification.status}"
    end

    render :show
  end

  def summary
    @big_order = BigOrder.find(params[:req]) if params[:req]
    if !@big_order
      redirect_to orders_url
    else
      @big_order
    end
  end


  # GET /orders
  # GET /orders.xml

  def index
    @orders = current_user.orders

    respond_to do |format|
      format.html # application.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = current_user.orders.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  
  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = BigOrder.new
    @order.current_step = session[:order_step]
    @customer = Customer.new
    if !current_user
      puts "NAO TEM SESSAO!!!!!!!!!!!"
      session[:payment_proccess] = true
      session[:order_step] = @order.steps.first
      @order.current_step = session[:order_step]
    elsif @order.first_step?
      puts "TEM SESSAOOOOO: #{current_user.inspect}"
      @order.next_step
      session[:order_step] = @order.current_step
    elsif params[:step]
      if @order.steps.include?(params[:step])
        session[:payment_proccess] = true
        session[:order_step] = params[:step]
        @order.current_step = session[:order_step]
      end
    elsif session[:order_step] == "payment"
      processar_pedido
      puts "JA FOI CHAMADO O METODO Processar_pedido"
      @order.current_step = session[:order_step]
    else
      @order.current_step = session[:order_step]
      processar_pedido
      puts "CURRENT_STEP: #{@order.current_step}"
      @order.current_step = session[:order_step]
      @order.next_step
      puts "DEFININDO O ENDERECO DO PEDIDO"
      session[:order_step] = @order.current_step
      puts "ULTIMO CURRENT_STEP: #{@order.current_step}"
      puts "ULTIMO CURRENT_STEP DA SESSION #{session[:order_step]}"
    end
    if current_user
        @order.address = current_user.shipping_address
    end

    session[:shipping_address_id] = @order.address.id if @order.address
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # POST /orders
  # POST /orders.xml
  def create
    puts "CRIANDO PEDIDO E SALVANDO NO BANCO DE DADOS"
    checkout
    #redirect_to pagseguro_developer_path
  end


  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  private

  def processar_pedido
    puts "CAIU NO PROCESSAMENTO DAS @ORDERS"

    @big_order = current_user.big_orders.build
    address_id = session[:shipping_address_id]
    if address_id
      @big_order.address = current_user.shipping_address
    end
    @big_order.create_orders_from_cart(current_cart)
    @big_order
  end

  def checkout
    @invoice = processar_pedido
    puts "Verificando o bigorder: #{@invoice.inspect}"
    puts "Orders do bigorder: #{@invoice.orders}"
    if @invoice.save
      puts "Consegui Salvar, destroindo carrinho e sessao"
      cart = Cart.find(session[:cart_id])
      if cart
        cart.clear_line_items
        cart.save
        Cart.destroy(session[:cart_id])
      end      
      session[:cart_id] = nil
      puts "TESTANDO A INVOICE: "
      puts @invoice.inspect
      # Instanciando o objeto para geração do formulário
      criar_pagseguro_order
      puts "Verificando a order apos a adicao dos produtos:"
      puts @pagseguro_order.inspect
      puts @pagseguro_order.products.inspect
    else
      flash[:alert] = "Houve um erro ao tentar salvar seu pedido"
      redirect_to root_url
    end
    @order = @pagseguro_order
  end

  def criar_pagseguro_order
    @pagseguro_order = PagSeguro::Order.new(@invoice.id)
    puts "Verificando o order do pagseguro"
    puts @pagseguro_order.inspect
    puts @invoice.orders
    # adicionando os produtos do pedido ao objeto do formulário
    @invoice.orders.each do |order|
      # Estes são os atributos necessários. Por padrão, peso (:weight) é definido para 0,
      # quantidade é definido como 1 e frete (:shipping) é definido como 0.
      order.line_items.each do |item|
        @pagseguro_order.add :id => item.product.id, :price => item.product.price, :description => item.product.name, :quantity => item.quantity
      end
    end
  end
  
end