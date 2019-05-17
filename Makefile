paper = mhgan

# Grab all possible source
source := $(shell ls Makefile *.tex *.sty figures/*pdf figures/*png figures/*jpg 2>/dev/null)
sourcebib := $(shell ls *.bib )



all: ${paper}.pdf

${paper}.bbl: ${sourcebib}
	pdflatex ${paper}
	bibtexall
	pdflatex ${paper}

${paper}.pdf: ${paper}.bbl ${source}
	pdflatex ${paper}
	pdflatex ${paper}

quick:
	pdflatex -halt-on-error ${paper}

skim:
	skimreload ${paper}.pdf

skimbg:
	skimreloadbg ${paper}.pdf

watch: quick skim
	while true; do for file in ${source}; do if [ "$$file" -nt ${paper}.pdf ]; then make quick skimbg; fi; done; sleep 1; done

clean:
	rm -rf *.aux *.blg *.bbl *.log *.out ${paper}.pdf arxiv





# The below targets are just used to produce an arXiv version

arxiv:
	pdflatex mhgan
	bibtex mhgan.aux
	mkdir -p arxiv arxiv/figures arxiv/figures/pgan arxiv/figures/cifar arxiv/figures/celeba
	#cp -a mhgan.tex mhgan.bbl *.sty arxiv/
	cp -a mhgan.tex mhgan.bbl mhgan.aux   *.sty arxiv/
	cp -a alg_mhgan.tex fig_calibration.tex fig_celeba_samples.tex fig_cifar_samples.tex fig_inception.tex fig_intro.tex fig_mog_example.tex fig_mog_metrics.tex fig_univariate_example.tex supp.tex supp_mat.tex tbl_inception.tex arxiv/
	#cp -a mhgan.tex            *.sty arxiv/
	cp -aL figures/coord_descent.png figures/block_diag.png figures/univariate_example_flat.pdf figures/mog_unified_smaller.pdf figures/std_flat.pdf figures/hqr_flat.pdf figures/jsd_flat.pdf figures/per_epoch_flat.pdf figures/plot_per_mh_flat.pdf figures/score_dist_bta_flat.pdf figures/disc_calib_cifar_flat.pdf figures/disc_calib_celeba_flat.pdf arxiv/figures/
	cp -aL figures/pgan/48_base_iso_base.jpg figures/pgan/49_base_iso_base.jpg figures/pgan/48_base_iso_reject.jpg figures/pgan/49_base_iso_reject.jpg figures/pgan/48_base_iso_MH.jpg figures/pgan/49_base_iso_MH.jpg figures/pgan/50_base_iso_base.jpg figures/pgan/51_base_iso_base.jpg figures/pgan/50_base_iso_reject.jpg figures/pgan/51_base_iso_reject.jpg figures/pgan/50_base_iso_MH.jpg figures/pgan/51_base_iso_MH.jpg figures/pgan/52_base_iso_base.jpg figures/pgan/53_base_iso_base.jpg figures/pgan/52_base_iso_reject.jpg figures/pgan/53_base_iso_reject.jpg figures/pgan/52_base_iso_MH.jpg figures/pgan/53_base_iso_MH.jpg figures/pgan/54_base_iso_base.jpg figures/pgan/55_base_iso_base.jpg figures/pgan/54_base_iso_reject.jpg figures/pgan/55_base_iso_reject.jpg figures/pgan/54_base_iso_MH.jpg figures/pgan/55_base_iso_MH.jpg figures/pgan/56_base_iso_base.jpg figures/pgan/57_base_iso_base.jpg figures/pgan/56_base_iso_reject.jpg figures/pgan/57_base_iso_reject.jpg figures/pgan/56_base_iso_MH.jpg figures/pgan/57_base_iso_MH.jpg figures/pgan/58_base_iso_base.jpg figures/pgan/59_base_iso_base.jpg figures/pgan/58_base_iso_reject.jpg figures/pgan/59_base_iso_reject.jpg figures/pgan/58_base_iso_MH.jpg figures/pgan/59_base_iso_MH.jpg figures/pgan/60_base_iso_base.jpg figures/pgan/61_base_iso_base.jpg figures/pgan/60_base_iso_reject.jpg figures/pgan/61_base_iso_reject.jpg figures/pgan/60_base_iso_MH.jpg figures/pgan/61_base_iso_MH.jpg figures/pgan/62_base_iso_base.jpg figures/pgan/63_base_iso_base.jpg figures/pgan/62_base_iso_reject.jpg figures/pgan/63_base_iso_reject.jpg figures/pgan/62_base_iso_MH.jpg figures/pgan/63_base_iso_MH.jpg figures/pgan/all_base_iso_base_llq.jpg figures/pgan/4_base_iso_base.jpg figures/pgan/5_base_iso_base.jpg figures/pgan/8_base_iso_base.jpg figures/pgan/34_base_iso_base.jpg figures/pgan/all_base_iso_reject_llq.jpg figures/pgan/all_base_iso_MH_llq.jpg arxiv/figures/pgan/
	cp -aL figures/cifar/192_base_raw_base_smaller_bigger.png figures/cifar/192_base_raw_reject_smaller_bigger.png figures/cifar/192_base_raw_MH_smaller_bigger.png figures/cifar/192_base_iso_MH_smaller_bigger.png arxiv/figures/cifar/
	cp -aL figures/celeba/31_base_raw_base.jpg figures/celeba/31_base_raw_reject.jpg figures/celeba/31_base_raw_MH.jpg figures/celeba/31_base_iso_MH.jpg arxiv/figures/celeba/
	tar cvzf arxiv.tar.gz arxiv

arxiv-test: arxiv
	cd arxiv && pdflatex mhgan && pdflatex mhgan
