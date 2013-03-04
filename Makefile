
build: flim copy-files min-css
deploy: gzip rsync


flim:
	@./node_modules/flim/bin/flim.js

copy-files: 
	@rsync -aq --exclude='_*' ./src/ ./build 

watch: 
	fswatch ./src make build

min-css:
	@./node_modules/cssmin/bin/cssmin ./src/stylesheets/screen.css > ./build/stylesheets/screen.css

server:
	@./node_modules/http-server/bin/http-server ./build

gzip:
	@find ./build -type f | \
	while read -r x; \
	do \
		gzip -c -9 $$x > $$x.gz; \
	done

rsync: 
	@rsync -avz -e "ssh" --delete ./build/ shapeshed.com:/srv/shapeshed.com
