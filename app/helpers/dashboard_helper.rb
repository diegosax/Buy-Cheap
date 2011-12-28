module DashboardHelper
	def most_sold_products 
		@products = Product.find_by_sql("select *, P.id from line_items L JOIN Products P ON L.product_id = P.id Group By P.id Order By SUM(quantity) DESC")
	end
end
