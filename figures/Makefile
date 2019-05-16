targets = \
pgan/all_base_iso_base_llq.jpg \
pgan/all_base_iso_MH_llq.jpg \
pgan/all_base_iso_reject_llq.jpg


all: ${targets}

pgan/all_base_iso_base_llq.jpg: pgan/all_base_iso_base.jpg
	convert $< -resize 50% -quality 40 $@

pgan/all_base_iso_MH_llq.jpg: pgan/all_base_iso_MH.jpg
	convert $< -resize 50% -quality 40 $@

pgan/all_base_iso_reject_llq.jpg: pgan/all_base_iso_reject.jpg
	convert $< -resize 50% -quality 40 $@

clean:
	rm -f ${targets}
