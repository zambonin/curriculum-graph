SRC_FILES = by-nc-sa.svg logo-ufsc.svg
OUTPUT_SVG = graph.svg
OUTPUT_PNG = graph.png

all: $(OUTPUT_SVG) $(OUTPUT_PNG) $(SRC_FILES)

%.png: %.dot /usr/bin/dot
	dot -Tpng $< -o $@

%.svg: %.dot /usr/bin/dot
	dot -Tsvg $< -o $@

by-nc-sa.svg: /usr/bin/curl
	curl -O https://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-nc-sa.svg

logo-ufsc.svg: /usr/bin/curl /usr/bin/gzip /usr/bin/rsvg-convert
	curl https://identidade.ufsc.br/files/2010/09/brasao_UFSC_vertical_sigla_fundo-claro_svg.zip -o - \
		| gzip -d \
		| rsvg-convert --keep-aspect-ratio --format svg --width 125 --output $@

clean:
	$(RM) $(OUTPUT_SVG) $(OUTPUT_PNG)
