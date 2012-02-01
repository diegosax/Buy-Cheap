module ProductsHelper
	def related_products_from_a_company(company_id)
		@company = Company.find(company_id)
		@company.products.take(6)
	end

	def company_ids(ids)
		ids ? ids.split(",").map(&:to_i) : []
	end

	def add_company_id_param (id)
		params[:company_id] ||= ""
		(company_ids(params[:company_id]) << id).join(",")		
	end

	def remove_company_id_param (id)
		ids = company_ids(params[:company_id])
		ids.delete(id)
		stringfied_ids = ids.join(",")
		stringfied_ids == "" ? nil : stringfied_ids
	end

end
