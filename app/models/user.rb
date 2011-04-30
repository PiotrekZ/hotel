require 'digest'
class User < ActiveRecord::Base
	attr_accessible :email, :password, :first_name, :last_name, :street, :house, :city, :zip_code, :salt, :role

	validates_presence_of :role
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, :message => "Podany email jest nieprawidłowy"
	validates_format_of :password, :with => /^[a-zA-Z0-9]{6,}$/, :message => "Hasło musi się składać z przynajmniej 6 znaków"
	validates_format_of :first_name, :with => /^[A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}$/, :message => "Podane imię jest nieprawidłowe"
	validates_format_of :last_name, :with => /^([A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}){1}(-[A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}){0,1}$/, :message => "Podane nazwisko jest nieprawidłowe"
	validates_format_of :street, :with => /^[A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}$/, :message => "Podane ulica jest nieprawidłowa"
	validates_format_of :house, :with => /^[\/a-zA-Z0-9]{1,}$/, :message => "Podany Nr domu jest nieprawidłowy"
	validates_format_of :city, :with => /^[A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}$/, :message => "Podana Miejscowość jest nieprawidłowa"
	validates_format_of :zip_code, :with => /^[0-9]{2}-[0-9]{3}$/, :message => "Podany Kod pocztowy jest nieprawidłowy"
	#User.create!(:email=>"jakis@mail.com", :password=>"trudne", :first_name=>"Jan", :last_name=>"Kowalski", :street=>"Blotna", :house=>10, :city=>"Miastooo", :zip_code=>"55-123", :role=>"Klient")
	before_save :encrypt_password
	
	def has_password?(submitted_password)
		password == encrypt(submitted_password)
	end
  
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil  if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end

	private

    def encrypt_password
		self.salt = make_salt if new_record?
		self.password = encrypt(password)
    end

    def encrypt(string)
		secure_hash("#{salt}--#{string}")
    end

    def make_salt
		secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
		Digest::SHA2.hexdigest(string)
    end
end