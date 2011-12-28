module DashboardHelper
	def most_sold_products 
		Product.joins(:line_items)
	end
end
