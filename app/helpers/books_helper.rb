module BooksHelper
	def get_amazon_link(title, author)
		# "http://rcm.amazon.com/e/cm?lt1=_blank&bc1=FFFFFF&IS1=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=0000FF&t=booclu00-20&o=1&p=8&l=as1&m=amazon&f=ifr&ref=qf_sp_asin_til&asins=1613821530"
		#{ }"book link for #{title} by #{author}"
		searchterms = title.split
		searchterms << "by"
		searchterms << author.split
		searchterms = searchterms.join("+").downcase
		"http://www.amazon.com/s/ref=nb_sb_noss_1?url=search-alias%3Daps&field-keywords=#{searchterms}&linkCode=xm2&tag=booclu00-20"
	end
end
