class AddPaymentStatusToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_status, :string, :default => "Aguardando Pagamento"
  end

  def self.down
    remove_column :orders, :payment_status
  end
end
