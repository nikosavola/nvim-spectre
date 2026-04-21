test:
	nvim --headless --noplugin -u tests/minimal.vim -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal.vim'}"

lint:
	luacheck lua/ tests/ plugin/

format:
	stylua lua/

format-check:
	stylua --check lua/

build-oxi:
	./build.sh
