targets = \
150_base_iso_MH.jpg \
150_base_raw_base.jpg \
150_base_raw_reject.jpg \
30_base_iso_MH.jpg \
30_base_raw_base.jpg \
30_base_raw_reject.jpg \
data.jpg

all: ${targets}

%.jpg: %.png
	convert $< -quality 80 $@

clean:
	rm -f ${targets}
