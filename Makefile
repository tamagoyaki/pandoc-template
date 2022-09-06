SRC = DRAFT
FMT = docx
DST = $(SRC).$(FMT)
REF = custom-reference.docx

help:
	@echo 'make docx'
	@echo 'make clean'

docx: $(DST)
$(DST): $(SRC) $(REF)
	@cat $< | pandoc --toc --reference-doc=$(REF) -t $(FMT) -o $@
$(REF):
	@pandoc --print-default-data-file reference.docx > $@

clean:
	$(RM) $(DST)
