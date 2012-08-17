.PHONY: build rebuild clean check

DEPS=static/LinLibertine_R.woff static/LinLibertine_RB.woff static/html5shiv.js

build: hakyll $(DEPS)
	./hakyll build

rebuild: hakyll $(DEPS)
	./hakyll rebuild

check: build .linkcheckerrc
	linkchecker --config=.linkcheckerrc _site/index.html

.linkcheckerrc:
	echo "[checking]" >> .linkcheckerrc
	echo "anchors=1" >> .linkcheckerrc
	echo "[filtering]" >> .linkcheckerrc
	echo "ignorewarnings=http-robots-denied" >> .linkcheckerrc

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
	-rm -f .linkcheckerrc
