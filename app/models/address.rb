class Address < ActiveRecord::Base
  validates :bairro, :address, :zipcode, :number, :city, :state, :presence => true
  belongs_to :customer
  belongs_to :company
  has_many :big_orders
  has_many :orders
end