NAME=Screen\ Rotation\ Toggle
SCRIPT=$(NAME).applescript
SERVICE=$(NAME).workflow
APP=$(NAME).app
SRVPATH=~/Library/Services

all: redist install

$(APP): $(SCRIPT)
	osascript BuildApp.applescript

install: $(APP) uninstall
	cp -a $(SERVICE) $(APP) $(SRVPATH)/
	@echo
	@echo "Remember to set a shortcut key in"
	@echo "    System Preferences > Keyboard > Shortcuts > Services"

uninstall:
	if [ -e $(SRVPATH)/$(SERVICE) ]; then rm -r $(SRVPATH)/$(SERVICE); fi
	if [ -e $(SRVPATH)/$(APP) ]; then rm -r $(SRVPATH)/$(APP); fi

redist: $(APP)
	$(eval BASE := $(shell basename $(CURDIR))--$(shell date +%Y-%m-%d))
	mkdir $(BASE)
	cp -a $(APP) $(SERVICE) $(BASE)/
	cp -a README.md $(BASE)/README.txt
	zip -9r --symlinks $(BASE).zip $(BASE)
	rm -rf $(BASE)

clean:
	if [ -e $(APP) ]; then rm -r $(APP); fi
