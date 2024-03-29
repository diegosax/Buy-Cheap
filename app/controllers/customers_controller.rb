class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.xml
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # application.html.erb
      format.xml  { render :xml => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new
    @customer.addresses.build


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.xml
  def create
    respond_to do |format|
      format.js do
        begin
          @address = BuscaEndereco.por_cep(params[:zipcode])
          puts "VALOR DO ENDERECO DO CEP: #{@address.inspect}"
        rescue
          @address = nil
          return
        end
        return
      end
      format.html do
        @customer = Customer.new(params[:customer])
        @customer.addresses.first.preferred = true if @customer.addresses.first
        if @customer.save
          session[:user_id] = @customer.id
          current_cart.empty? ? redirect_path = root_url : redirect_path = new_order_url
          redirect_to(redirect_path, :notice => "Cadastro efetuado com sucesso")
          return          
        else          
          format.html { render :action => "new" }
          format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@customer, :notice => 'Customer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end
end
