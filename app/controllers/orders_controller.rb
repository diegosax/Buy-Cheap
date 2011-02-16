class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml

  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

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
    if !current_user
      session[:payment_proccess] = true
      session[:order_step] = @order.steps.first
      @order.current_step = session[:order_step]
    elsif @order.first_step?
      @order.next_step
      session[:order_step] = @order.current_step
    elsif params[:step]
      if @order.steps.include?(params[:step])
        session[:payment_proccess] = true
        session[:order_step] = params[:step]
        @order.current_step = session[:order_step]
      end
    else
      puts "CAIU NO PROCESSAMENTO DAS @ORDERS"
      address = Address.where(:id => params[:shipping_address_id]).first
      if !address
        address = current_user.addresses.where(:preferred => true).first || current_user.addresses.first
        if !address
          redirect_to "master_error"
        end
      end
      @order.current_step = session[:order_step]
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
      @order.current_step = session[:order_step]
      @order.next_step unless @order.last_step?
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
    
    if @big_order.save
      puts "Consegui Salvar, destroindo carrinho e sessao"
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      puts "Tentando redirecionar para o checkout"
      #checkout(@order)
      render "new"
        
    else
        
    end
    
  end

  def checkout(order)
    puts "OPA, estou no checkout, verificando order:"
    puts order.inspect
    @invoice = order
    
    # Instanciando o objeto para geração do formulário
    @order = PagSeguro::Order.new(@invoice.id)
    puts "Verificando o order do pagseguro"
    puts @order.inspect
    puts @invoice.line_items
    # adicionando os produtos do pedido ao objeto do formulário
    @invoice.line_items.each do |item|
      # Estes são os atributos necessários. Por padrão, peso (:weight) é definido para 0,
      # quantidade é definido como 1 e frete (:shipping) é definido como 0.
      @order.add :id => item.product.id, :price => item.product.price, :description => item.product.name, :quantity => item.quantity
    end
    puts "Verificando a order apos a adicao dos produtos:"
    puts @order.inspect
    puts @order.products.inspect

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
end