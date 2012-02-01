class ProductsController < ApplicationController
  before_filter :clear_steps_session
  helper :products
  #before_filter :is_company?, :only => [:edit, :update] Só pode editar o produto ser for uma empresa.
  # GET /products
  # GET /products.xml
  def index
    with_conditions = {}

    if params[:company_id]      
      with_conditions[:company_id] = company_ids params[:company_id]  
    end     
    with_conditions[:discount] = (params[:discount].to_i - 1)..101 if params[:discount]

    puts with_conditions.inspect
    @products = Product.search(
      params[:search],
      :star => true,        
      :with => with_conditions,        
      :page => params[:page],
      :per_page => 10
    )    
    
    #Company facets    
    with_conditions_without_company = with_conditions.clone
    with_conditions_without_company.delete(:company_id)
    @product_company_facets = Product.facets(
      params[:search], 
      :facets => [:company_id],
      :with => with_conditions_without_company
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
