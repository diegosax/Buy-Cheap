class DashboardController < ApplicationController
  def index
    @products = Product.all
    @greatest = Product.greatest

    @latest_products = Product.latest
  end

end
