require "nokogiri"
require "open-uri"
require "rubygems"
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
city = page.xpath("//a[@class='lientxt']/@href")
city_url = []
city.each do |a|
	city_url << a.text
end
town = page.xpath('//a[@class="lientxt"]')
_town = []
town.each do |v|
	_town << v.text
end
town_mail = []
city_url.each do |b|
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{b}"))
	add_mail = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	add_mail.each do |mail|
	town_mail << mail.text
end
end

array_city = Hash[_town.zip(town_mail)]
puts array_city