require "nokogiri"
require "open-uri"
require "rubygems"
#Ouvrir l'URL souhaitée sous Nokogiri et le stocker dans un objet 
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
#récupérer les élément de class=text-left col-symbol
  array_bitcoin = page.xpath("//td[@class='text-left col-symbol']")
#récuperer les élements
  all_symbol = []
  array_bitcoin.each do |symbol|
  all_symbol << symbol.text
  #return all_symbol
end
  array_price = page.xpath("//a[@class='price']")
  all_price = []
  array_price.each do |price|
  all_price << price.text
  #return all_price
end

price_without_dollar = []
all_price.each do |value|
 price_without_dollar << ("((#{value}))".delete '($)').to_f
end
	#return price_without_dollar
	# @prix.each do |i|
# @crypto << ("((#{i}))".delete '($)').to_f

hash_price = {}
hash_price = Hash[all_symbol.zip(price_without_dollar)]
    puts hash_price

