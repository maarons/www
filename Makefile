.PHONY: build rebuild clean

build: hakyll static/LinLibertine_R.woff static/LinLibertine_RB.woff static/html5shiv.js
	./hakyll build

rebuild: hakyll static/LinLibertine_R.woff static/LinLibertine_RB.woff static/html5shiv.js
	./hakyll rebuild

hakyll: hakyll.hs
	ghc -O2 -Wall -fno-warn-unused-do-bind --make hakyll.hs

static/LinLibertine_R.woff:
	wget --tries=5 "http://linuxlibertine.sourceforge.net/fonts/LinLibertine_R.woff" -O static/LinLibertine_R.woff

static/LinLibertine_RB.woff:
	wget --tries=5 "http://linuxlibertine.sourceforge.net/fonts/LinLibertine_RB.woff" -O static/LinLibertine_RB.woff

static/html5shiv.js:
	wget --tries=5 "https://raw.github.com/aFarkas/html5shiv/master/dist/html5shiv.js" -O static/html5shiv.js

clean:
	-rm -f hakyll *.o *.hi
	-rm -rf _cache
	-rm -rf _site
	-rm -f static/LinLibertine_*.woff
	-rm -f static/html5shiv.js
