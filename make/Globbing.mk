include py.mk

glob = $(shell $(PY) -c "import glob;print(' '.join( sorted( glob.glob('$(1)') )))")

print: $(call glob,**/*.globtarget)
	@echo $^