class Order < ActiveRecord::Base
  belongs_to :address
  belongs_to :company
  belongs_to :customer
  belongs_to :big_order
  #:dependent => :destroy indica que ao apagar uma order todos seus line_items tambem serao apagados
  has_many :line_items, :dependent => :destroy
  has_many :products, :through => :line_items

  attr_writer :current_step

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[identification shipping payment]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def last_step?
    current_step == steps.last
  end
  def first_step?
    current_step == steps.first
  end

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def price_in_cents
    (cart.total_price*100).round
  end

  #Metodo para adicionar os items que estao no carrinho ao pedido
  def add_line_items_from_cart(cart)
    companies = []
    cart.line_items.each do |item|
      if !companies.include?(item.product.company.name)
        companies << item.product.company.name
      end
    end
    puts "INSPECIONANDO ARRAY DE COMPANIES"
    puts companies.inspect
    companies.each do |company|
      cart.line_items.each do |item|
        if item.product.company.name == company
          
          line_items << item
        end
      end
    end
    puts "INspecionando o line_items"
    puts line_items.inspect
    line_items
  end


  private

  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end


end
