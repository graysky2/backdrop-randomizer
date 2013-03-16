VERSION = 2.21
PN = backdrop-randomizer
PN_SHORT = bdr

PREFIX ?= /usr
CONFDIR = /etc
BINDIR = $(PREFIX)/bin
DOCDIR = $(PREFIX)/share/doc/$(PN)-$(VERSION)
MANDIR = $(PREFIX)/share/man/man1

RM = rm
Q = @

all:
	$(Q)echo -e '\033[1;32mSetting version\033[0m'
	$(Q)sed -i -e 's/@VERSION@/'$(VERSION)'/' common/$(PN)

install-bin:
	$(Q)echo -e '\033[1;32mInstalling main script...\033[0m'
	install -Dm755 common/$(PN) "$(DESTDIR)$(BINDIR)/$(PN)"
	ln -s $(PN) "$(DESTDIR)$(BINDIR)/$(PN_SHORT)"

install-man:
	$(Q)echo -e '\033[1;32mInstalling manpage...\033[0m'
	install -Dm644 doc/$(PN).1 "$(DESTDIR)$(MANDIR)/$(PN_SHORT).1"
	gzip -9 "$(DESTDIR)$(MANDIR)/$(PN_SHORT).1"
	ln -s $(PN_SHORT).1.gz "$(DESTDIR)$(MANDIR)/$(PN).1.gz"

install: install-bin install-man

uninstall:
	$(Q)$(RM) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(Q)$(RM) "$(DESTDIR)$(BINDIR)/$(PN_SHORT)"
	$(Q)$(RM) "$(DESTDIR)$(MANDIR)/$(PN).1.gz"
	$(Q)$(RM) "$(DESTDIR)$(MANDIR)/$(PN_SHORT).1.gz"
