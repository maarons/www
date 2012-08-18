.PHONY: build rebuild clean check

build: hakyll static/html5shiv.js
	./hakyll build

rebuild: hakyll static/html5shiv.js
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

static/html5shiv.js:
	wget --tries=5 "https://raw.github.com/aFarkas/html5shiv/master/dist/html5shiv.js" -O static/html5shiv.js

clean:
	-rm -f hakyll *.o *.hi
	-rm -rf _cache
	-rm -rf _site
	-rm -f static/html5shiv.js
	-rm -f .linkcheckerrc
