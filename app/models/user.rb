class User < ActiveRecord::Base
  has_many :orders
  has_many :addresses
  has_many :big_orders
  accepts_nested_attributes_for :addresses
  attr_accessible :email, :password, :password_confirmation, :area,
                  :birthdate, :celphone, :document, :image, :name,
                  :razao_social, :sex, :telephone, :addresses_attributes, :remote_image_url


  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    puts "Buscando usuario com email: #{email.inspect}"
    user = find_by_email(email)
    puts "USUARIO ENCONTRDo: #{user.inspect}"
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def format_telephone
    self.telephone = self.telephone.gsub(/(\d{2})(\d{4})(\d{4})/, '(\1)\2-\3') || self.telephone if telephone
    puts "Telefone Formatado: #{self.telephone}"
  end

  def format_celphone
    self.celphone = self.celphone.gsub(/(\d{2})(\d{4})(\d{4})/, '(\1)\2-\3') || self.celphone if celphone
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


end

