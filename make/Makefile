ALL=a a-tests b-tests b c
all: $(ALL)
ifeq ($(OS),Windows_NT)
REMOVE=del
else
REMOVE=rm
endif
make_stamp_file = echo "[$(1)]" && echo "$(1)" > $(1)

a:
	@$(call make_stamp_file,a)

a-tests: a
	@$(call make_stamp_file,a-tests)

b: a
	@$(call make_stamp_file,b)

b-tests: b
	@$(call make_stamp_file,b-tests)

c: a
	@$(call make_stamp_file,c)

clean:
	-@$(REMOVE) $(ALL)