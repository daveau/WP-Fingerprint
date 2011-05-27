require 'nokogiri'
require 'open-uri'

(1..971).each do |counter|
	doc = Nokogiri::HTML(open('http://wordpress.org/extend/plugins/browse/new/page/'+counter.to_s))
	doc.css('div[class="plugin-block"]').each do |plugin|
		puts ""
		plugin.css('h3 > a').each do |link|
			printf link.content+","
			subdoc = Nokogiri::HTML(open(link['href']))
			subdoc.css('div[class="col-3"] > p').each do |p|
				p.css('a').each do |link|
					printf link['href']
				end
			end
		end
		plugin.css('ul > li').each do |li|
			li.css('span[class="info-marker"]').each do |info|
				#puts info.content
				printf ","
				printf li.content.split[1]
			end
		end
	end
end



