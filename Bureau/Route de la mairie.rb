require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))   
puts page.class   # => Nokogiri::HTML::Bureau

get_the_email_of_a_townhal_from_its_webpage