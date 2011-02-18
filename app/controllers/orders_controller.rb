class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only=>[:notification,:confirm]

  def notification
    notes = Moip.notification[:email]
    puts notes.inspect
    assert_response :success
  end

  def direct_charge
    @invoice = processar_pedido
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
    else
      flash[:alert] = "Houve um erro ao tentar salvar seu pedido"
      redirect_to root_url
    end
    puts "Verificando valor do total_price antes de enviar: #{@invoice.total_price}"

    response = Moip.authorize(@invoice,current_user)
    redirect_to Moip.charge_url(response["Token"])
  end


  def manual_charge
    @response = Moip.authorize(:reason=>"Mensalidade",:id=>"Pag#{rand(1000)}",:value=>1)
  end

  def summary
    if params[:req]
      @big_order = BigOrder.find(params[:req])
    end
    
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

    render :nothing => true
  end


  # GET /orders
  # GET /orders.xml

  def index
    @orders = current_user.orders

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = BigOrder.last

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  
  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    @order.current_step = session[:order_step]
    puts "INICIO DO METODO: #{@order.current_step} - #{session[:order_step]}"
    if !current_user
      session[:payment_proccess] = true
      session[:order_step] = @order.steps.first
      @order.current_step = session[:order_step]
    elsif @order.first_step?
      address = Address.where(:id => params[:shipping_address_id]).first
      if !address
        address = current_user.addresses.where(:preferred => true).first || current_user.addresses.first
        if !address
          redirect_to "master_error"
        end
      end
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
      session[:order_step] = @order.current_step
      puts "ULTIMO CURRENT_STEP: #{@order.current_step}"
      puts "ULTIMO CURRENT_STEP DA SESSION #{session[:order_step]}"
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    puts "CRIANDO PEDIDO E SALVANDO NO BANCO DE DADOS"
    checkout
    #redirect_to pagseguro_developer_path
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
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
    address = Address.where(:id => params[:shipping_address_id]).first
    if !address
      address = current_user.addresses.where(:preferred => true).first || current_user.addresses.first
      if !address
        redirect_to "master_error"
      end
    end

    @big_order = current_user.big_orders.build
    @order_cart = Order.new
    @order_cart.add_line_items_from_cart(current_cart)
    company = ""
    @order_cart.line_items.each do |item|
      if item.product.company.name != company
        @order = @big_order.orders.build
        @order.company = item.product.company
        @order.customer = current_user
        @order.line_items << item
        company = item.product.company.name
      else
        @order.line_items << item
      end
      @order.address = address
      puts @order.inspect
    end
    @big_order
  end

  def checkout
    @invoice = processar_pedido

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