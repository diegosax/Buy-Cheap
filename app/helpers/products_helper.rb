module ProductsHelper
	def related_products_from_a_company(company_id)
		@company = Company.find(company_id)
		@company.products
	end
end
