class ProductsController < ApplicationController
  before_filter :clear_steps_session
  #before_filter :is_company?, :only => [:edit, :update] Só pode editar o produto ser for uma empresa.
  # GET /products
  # GET /products.xml
  def index
    with_conditions = {}
    with_conditions[:company_id] = params[:company_id] unless !params[:company_id]
    
    @products = Product.search(
      params[:search],
      :star => true,        
      :with => with_conditions,
        
      :page => params[:page],
      :per_page => 5

    )  

    respond_to do |format|
        format.html # application.html.erb
        format.xml  { render :xml => @products }
    end
  end

    # GET /products/1
    # GET /products/1.xml
    def show
      @product = Product.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @product }
      end
    end
  end
