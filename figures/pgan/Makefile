targets = \
0_base_iso_MH.jpg \
0_base_raw_base.jpg \
0_base_raw_reject.jpg \
10_base_iso_MH.jpg \
10_base_raw_base.jpg \
10_base_raw_reject.jpg \
11_base_iso_MH.jpg \
11_base_raw_base.jpg \
11_base_raw_reject.jpg \
12_base_iso_MH.jpg \
12_base_raw_base.jpg \
12_base_raw_reject.jpg \
13_base_iso_MH.jpg \
13_base_raw_base.jpg \
13_base_raw_reject.jpg \
14_base_iso_MH.jpg \
14_base_raw_base.jpg \
14_base_raw_reject.jpg \
15_base_iso_MH.jpg \
15_base_raw_base.jpg \
15_base_raw_reject.jpg \
1_base_iso_MH.jpg \
1_base_raw_base.jpg \
1_base_raw_reject.jpg \
2_base_iso_MH.jpg \
2_base_raw_base.jpg \
2_base_raw_reject.jpg \
3_base_iso_MH.jpg \
3_base_raw_base.jpg \
3_base_raw_reject.jpg \
4_base_iso_MH.jpg \
4_base_raw_base.jpg \
4_base_raw_reject.jpg \
5_base_iso_MH.jpg \
5_base_raw_base.jpg \
5_base_raw_reject.jpg \
6_base_iso_MH.jpg \
6_base_raw_base.jpg \
6_base_raw_reject.jpg \
7_base_iso_MH.jpg \
7_base_raw_base.jpg \
7_base_raw_reject.jpg \
8_base_iso_MH.jpg \
8_base_raw_base.jpg \
8_base_raw_reject.jpg \
9_base_iso_MH.jpg \
9_base_raw_base.jpg \
9_base_raw_reject.jpg

all: ${targets}

%.jpg: %.png
	convert $< -quality 60 $@

clean:
	rm -f ${targets}
