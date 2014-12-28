NAME=Screen\ Rotation\ Toggle
SCRIPT=$(NAME).applescript
SERVICE=$(NAME).workflow
APP=$(NAME).app
SRVPATH=~/Library/Services

all: install

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

clean:
	if [ -e $(APP) ]; then rm -r $(APP); fi
