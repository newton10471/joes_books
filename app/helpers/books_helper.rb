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

	def amazon_pic_url(asin)
#		'<a href="http://www.amazon.com/gp/product/' + asin + '/ref=as_li_tf_il?ie=UTF8&camp=1789&creative=9325&creativeASIN=' + asin + '&linkCode=as2&tag=booclu00-20"><img border="0" src="http://ws.assoc-amazon.com/widgets/q?_encoding=UTF8&ASIN=' + asin + '&Format=_SL110_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=booclu00-20" ></a><img src="http://www.assoc-amazon.com/e/ir?t=booclu00-20&l=as2&o=1&a=' + asin + '" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />'
	
		'<a href="http://www.amazon.com/gp/product/' + asin + '/ref=as_li_tf_il?ie=UTF8&camp=1789&creative=9325&creativeASIN=' + asin + '&linkCode=as2&tag=booclu00-20"><img border="0" src="http://ws.assoc-amazon.com/widgets/q?_encoding=UTF8&ASIN=' + asin + '&Format=_SL110_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=booclu00-20" ></a><img src="http://www.assoc-amazon.com/e/ir?t=booclu00-20&l=as2&o=1&a=' + asin + '" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />'

	end


end
