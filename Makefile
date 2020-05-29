

build:
	mkdocs build --clean --config-file ./mkdocs.yml

serve: build
	mkdocs serve

deploy: build
	rsync -ad _build/html/ lami:/var/www/arkimet/mmmpc
