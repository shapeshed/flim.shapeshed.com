SHELL := /bin/bash
CSSMD5 = $(shell md5sum ./build/stylesheets/application* | awk '{ print $$1 }')
JSMD5 = $(shell md5sum ./build/javascripts/application* | awk '{ print $$1}')

build: flim copy-files concat-css min-css md5-css replace-css-string concat-js min-js md5-js replace-js-string
deploy: gzip rsync

flim:
	@./node_modules/flim/bin/flim generate

copy-files: 
	@rsync -aq --exclude='_*' --exclude='*.css' --exclude='*.js' ./src/ ./build 

watch: 
	fswatch ./src make build

concat-css:
	@cat ./src/stylesheets/screen.css ./src/stylesheets/solarized_dark.min.css  > ./build/stylesheets/application.css.tmp

min-css:
	@./node_modules/cssmin/bin/cssmin ./build/stylesheets/application.css.tmp > ./build/stylesheets/application.css && rm ./build/stylesheets/application.css.tmp

md5-css: 
	@mv ./build/stylesheets/application.css ./build/stylesheets/application-$(CSSMD5).css 

replace-css-string:
	@find ./build -name index.html | xargs sed -i "s/screen\.css/application-$(CSSMD5)\.css/" 

concat-js:
	@cat src/javascripts/highlight.min.js > ./build/javascripts/application.js.tmp 

min-js:
	@./node_modules/uglify-js/bin/uglifyjs ./build/javascripts/application.js.tmp > ./build/javascripts/application.js && rm ./build/javascripts/application.js.tmp

md5-js: 
	@mv ./build/javascripts/application.js ./build/javascripts/application-$(JSMD5).js 

replace-js-string:
	@find ./build -name index.html | xargs sed -i "s/application\.js/application-$(JSMD5)\.js/" 

server:
	@./node_modules/http-server/bin/http-server ./build

gzip:
	@find ./build -type f | while read -r x; do gzip -9 -c $$x > $$x.gz; done 

rsync: 
	@rsync -az -e "ssh" --delete ./build/ shapeshed.com:/srv/shapeshed.com
