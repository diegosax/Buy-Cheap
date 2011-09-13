class BigOrdersController < ApplicationController
  before_filter :authenticate_user!
  # GET /big_orders
  # GET /big_orders.xml
  def index
    @big_orders = current_user.big_orders

    respond_to do |format|
      format.html # application.html.erb
      format.xml  { render :xml => @big_orders }
    end
  end
end
