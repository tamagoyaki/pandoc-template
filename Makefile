SRC = DRAFT
FROM = markdown
TO = docx
FMT = $(TO)
DST = $(SRC).$(FMT)
REF = custom-reference.docx

help:
	@echo 'make docx'
	@echo 'make clean'

docx: $(DST)
$(DST): $(SRC) $(REF)
	@cat $< | pandoc --toc --reference-doc=$(REF) -f $(FROM) -t $(TO) -o $@
$(REF):
	@pandoc --print-default-data-file reference.docx > $@

clean:
	$(RM) $(DST)
