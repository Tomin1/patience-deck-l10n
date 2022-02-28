TEMPLATE = aux

include(translations.pri)

defineReplace(createFilenames) {
    list = $$1
    prefix = $$2
    postfix = $$3
    files =
    for (name, list) {
        files += $${prefix}$${name}$${postfix}
    }
    return($$files)
}

TRANSLATIONS = $$createFilenames($$LANGUAGES, $$PWD/patience-deck-, .ts)
TS_FILE = $$PWD/patience-deck.ts

# Update all ts files
ts.CONFIG = no_check_exists
ts.input = $$TS_FILE
ts.output = $$TRANSLATIONS
qtPrepareTool(LUPDATE, lupdate)
for (tsfile, TRANSLATIONS): ts.commands +=$$LUPDATE $$TS_FILE -ts $$tsfile $$escape_expand(\n\t)

# Create qm files
qm.depends = ts
qm.input = $$TRANSLATIONS
qm_install.CONFIG = no_check_exist
qm_install.depends = qm
qm_install.path = /usr/share/$$(NAME)/translations
qtPrepareTool(LRELEASE, lrelease)
for (tsfile, TRANSLATIONS) {
    qmfile = $$shadowed($$tsfile)
    qmfile ~= s,.ts$,.qm,
    qm.commands +=$$LRELEASE -idbased -removeidentical $$tsfile -qm $$qmfile $$escape_expand(\n\t)
    qm_install.files += $$qmfile
}

QMAKE_EXTRA_TARGETS += ts qm
PRE_TARGETDEPS += ts qm
INSTALLS += qm_install
