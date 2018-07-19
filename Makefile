

build:
	mkdocs build --clean --config-file ./mkdocs.yml

serve:
	mkdocs serve

deploy: build
	rsync -ad _build/html/ lami:/arkimet/mmmpc
