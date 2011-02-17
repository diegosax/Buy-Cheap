class CartsController < ApplicationController

  # GET /carts/1
  # GET /carts/1.xml
  def show
    @cart = Cart.find(current_cart)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cart }
    end
  end
  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # PUT /carts/1
  # PUT /carts/1.xml
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to(@cart, :notice => 'Cart was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(root_url, :notice => 'Your cart is currently empty' ) }
      format.xml { head :ok }
    end

  end

 

end
