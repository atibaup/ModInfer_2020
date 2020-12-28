# Minimal makefile for Sphinx documentation
#
SHELL := bash
.ONESHELL: # instructs make to use the same shell within a recipe
.SHELLFLAGS := -eu -o pipefail -c # a few recommended shell flags

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = ModelitzacióIInferència
SOURCEDIR     = .
BUILDDIR      = _build
GITHUB_PAGE_ROOT = docs/

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

.PHONY: build pdf
build:
	make html
	make slides
	make latexpdf

publish: build
	cp -R $(BUILDDIR)/html $(GITHUB_PAGE_ROOT)/
	cp -R $(BUILDDIR)/slides $(GITHUB_PAGE_ROOT)/
	cp $(BUILDDIR)/latex/ModelitzacióIInferència.pdf $(GITHUB_PAGE_ROOT)/latex/ModelitzacióIInferència.pdf
	cp $(BUILDDIR)/latex/ModelitzacióIInferència.tex $(GITHUB_PAGE_ROOT)/latex/ModelitzacióIInferència.tex
	git add --all _static/
	git add --all $(BUILDDIR)/html/_static/
	git add --all $(BUILDDIR)/slides/_static/
	git add -f $(BUILDDIR)/latex/ModelitzacióIInferència.tex
	git add -f $(BUILDDIR)/latex/ModelitzacióIInferència.pdf
	git add --all $(GITHUB_PAGE_ROOT)/html/_images
	git add --all $(GITHUB_PAGE_ROOT)/slides/_images
	git add --all $(GITHUB_PAGE_ROOT)/html/_static
	git add --all $(GITHUB_PAGE_ROOT)/slides/_static
	git add $(GITHUB_PAGE_ROOT)/latex/ModelitzacióIInferència.tex
	git add $(GITHUB_PAGE_ROOT)/latex/ModelitzacióIInferència.pdf
	git commit -a -m 'Updating materials...'
	git push origin master

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

