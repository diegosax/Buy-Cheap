module ApplicationHelper

  #metodo para formatar o valor em Real R$
  def valor_formatado(number)
    number_to_currency(number, :unit => "R$", :separator => ",", :delimiter => ".")
  end


  def percentagem_desconto(preco_original, preco_novo)
    ((1 - preco_novo/preco_original) * 100).round
  end

end
