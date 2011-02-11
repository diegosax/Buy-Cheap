class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  before_filter authenticate_user!, :only => :create
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
    @big_order = BigOrder.new
    @order_cart = Order.new
    @order_cart.add_line_items_from_cart(current_cart)
    # Busca o pedido associado ao usuário; esta lógica deve
    # ser implementada por você, da maneira que achar melhor
    company = ""
    @order_cart.line_items.each do |item|
      if item.product.company.to_s != company
        puts "a company do item eh diferente da atual"
        @order = Order.new
        @order.company = item.product.company
        @order.customer = current_user
        @order.big_order = @big_order
        puts "@order: #{@order.inspect}"
        puts "Tentando salvar"
        if !@order.save
          puts "Nao consegui salvar"
          flash[:alert] = "Seu pedido nao pode ser criado. Por favor tente novamente mais tarde"
          redirect_to root_url
        end
      end
      company = item.product.company
    end

    respond_to do |format|
      if @big_order.save
        puts "Consegui Salvar, destroindo carrinho e sessao"
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        puts "Tentando redirecionar para o checkout"
        checkout(@order)
        puts "Axo q nao redirecionou"
        format.html {redirect_to "checkout"}
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
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
