require "digest/sha1"
class User < ActiveRecord::Base
	validates_presence_of :login, :role
	validates_format_of :login, :with => /^[a-zA-Z0-9]{6,}$/, :message => "Login musi się składać z przynajmniej 6 znaków"
	validates_format_of :password, :with => /^[a-zA-Z0-9]{6,}$/, :message => "Hasło musi się składać z przynajmniej 6 znaków"
	validates_format_of :first_name, :with => /^[A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}$/, :message => "Podane imię jest nieprawidłowe"
	validates_format_of :last_name, :with => /^([A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}){1}(-[A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}){0,1}$/, :message => "Podane nazwisko jest nieprawidłowe"
	validates_format_of :street, :with => /^[A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}$/, :message => "Podane ulica jest nieprawidłowa"
	validates_format_of :house, :with => /^[\/a-zA-Z0-9]{1,}$/, :message => "Podany Nr domu jest nieprawidłowy"
	validates_format_of :city, :with => /^[A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśźż]{2,}$/, :message => "Podana Miejscowość jest nieprawidłowa"
	validates_format_of :zip_code, :with => /^[0-9]{2}-[0-9]{3}$/, :message => "Podany Kod pocztowy jest nieprawidłowy"
end