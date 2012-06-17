en: ready
	cd typefriendly && ./typefriendly build .. -l en
pl: ready
	cd typefriendly && ./typefriendly build .. -l pl
ready: typefriendly output
output:
	mkdir output
typefriendly:
	wget -c http://static.invenzzia.org/files/typefriendly-0.1.4.tar.bz2
	tar -xjf typefriendly-0.1.4.tar.bz2
	rm -i typefriendly-0.1.4.tar.bz2
	mv typefriendly-0.1.4 typefriendly
