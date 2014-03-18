NAME=qcode-spell
PACKAGEDIR=qcode_spell
VERSION=0.0.2
RELEASE=0
MAINTAINER=hackers@qcode.co.uk
REMOTEUSER=debian.qcode.co.uk
REMOTEHOST=debian.qcode.co.uk
REMOTEDIR=debian.qcode.co.uk

define DESCRIPTION
Implementation of Peter Norvig's spell check. C version by Marcelo Toledo.
endef

export DESCRIPTION

.PHONY: all

all: build package upload clean
package: 
	@echo "$$DESCRIPTION" > ./description-pak
	fakeroot checkinstall -D --deldoc --backup=no --install=no --pkgname=$(NAME) --pkgversion=$(VERSION) --pkgrelease=$(RELEASE) -A all -y --maintainer $(MAINTAINER) --pkglicense="BSD" --reset-uids=yes --requires "tcl8.5,tcllib" --replaces none --conflicts none make install

build:
	critcl -pkg ${NAME}.tcl

install: 
	mkdir -p /usr/lib/tcltk/$(PACKAGEDIR)${VERSION}
	cp -R lib/${NAME}/* /usr/lib/tcltk/$(PACKAGEDIR)${VERSION}/

upload:
	scp $(NAME)_$(VERSION)-$(RELEASE)_all.deb "$(REMOTEUSER)@$(REMOTEHOST):$(REMOTEDIR)/debs"	
	ssh $(REMOTEUSER)@$(REMOTEHOST) reprepro -b $(REMOTEDIR) includedeb squeeze $(REMOTEDIR)/debs/$(NAME)_$(VERSION)-$(RELEASE)_all.deb
	ssh $(REMOTEUSER)@$(REMOTEHOST) reprepro -b $(REMOTEDIR) includedeb wheezy $(REMOTEDIR)/debs/$(NAME)_$(VERSION)-$(RELEASE)_all.deb

clean:
	rm -f ./$(NAME)_$(VERSION)-$(RELEASE)_all.deb
	rm -rf ./lib
	rm -rf ./include
	rm -rf ./description-pak
