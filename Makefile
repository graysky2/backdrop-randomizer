VERSION = 2.31
PN = backdrop-randomizer
PN_SHORT = bdr

PREFIX ?= /usr
CONFDIR = /etc
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1
INITDIR_SYSTEMD = $(PREFIX)/lib/systemd/user

INSTALL = install -p
INSTALL_PROGRAM = $(INSTALL) -m755
INSTALL_DATA = $(INSTALL) -m644
INSTALL_DIR = $(INSTALL) -d

RM = rm -f
Q = @

all:
	$(Q)echo -e '\033[1;32mSetting version\033[0m'
	$(Q)sed 's/@VERSION@/'$(VERSION)'/' common/$(PN).in > common/$(PN)

install-bin:
	$(Q)echo -e '\033[1;32mInstalling main script...\033[0m'
	$(INSTALL_DIR) "$(DESTDIR)$(BINDIR)"
	$(INSTALL_PROGRAM) common/$(PN) "$(DESTDIR)$(BINDIR)/$(PN)"
	ln -s $(PN) "$(DESTDIR)$(BINDIR)/$(PN_SHORT)"

install-init:
	$(INSTALL_DIR) "$(DESTDIR)$(INITDIR_SYSTEMD)"
	$(INSTALL_DATA) init/$(PN_SHORT).service "$(DESTDIR)$(INITDIR_SYSTEMD)/$(PN_SHORT).service"
	$(INSTALL_DATA) init/$(PN_SHORT).timer "$(DESTDIR)$(INITDIR_SYSTEMD)/$(PN_SHORT).timer"

install-man:
	$(Q)echo -e '\033[1;32mInstalling manpage...\033[0m'
	$(INSTALL_DIR) "$(DESTDIR)$(MANDIR)"
	$(INSTALL_DATA) doc/$(PN).1 "$(DESTDIR)$(MANDIR)/$(PN_SHORT).1"
	gzip -9 "$(DESTDIR)$(MANDIR)/$(PN_SHORT).1"
	ln -s $(PN_SHORT).1.gz "$(DESTDIR)$(MANDIR)/$(PN).1.gz"

install: install-bin install-man install-init

uninstall:
	$(Q)$(RM) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(Q)$(RM) "$(DESTDIR)$(BINDIR)/$(PN_SHORT)"
	$(Q)$(RM) "$(DESTDIR)$(MANDIR)/$(PN).1.gz"
	$(Q)$(RM) "$(DESTDIR)$(MANDIR)/$(PN_SHORT).1.gz"
	$(Q)$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/$(PN_SHORT).service"
	$(Q)$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/$(PN_SHORT).timer"

clean:
	$(RM) -f common/$(PN)

.PHONY: install-bin install-man install-init install uninstall clean
