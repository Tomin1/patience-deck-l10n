Patience Deck translations
==========================
This repository is for [Patience Deck](https://github.com/Tomin1/patience-deck)
translations. Feel free to create translation to a new language or improve
existing translations by creating a pull request to this repository.

It's probably easiest to work with the translations by cloning this repository
separately. However it's also possible to clone Patience Deck repository and
update its submodules to get the same content.

Translations from GNOME Aisleriot
---------------------------------
Note that Patience Deck uses games from [GNOME
Aisleriot](https://wiki.gnome.org/Apps/Aisleriot) and thus also translations of
the texts in games. If you want to translate Patience Deck to a new language
that doesn't have translations for games yet, you should first submit those
game translations to [GNOME
Aisleriot](https://gitlab.gnome.org/GNOME/aisleriot/) and then ask for updating
Aisleriot submodule in [Patience Deck
repository](https://github.com/Tomin1/patience-deck).

At the moment game rules are not translated even if those were available in
Aisleriot. That is something to look at in the future.

Working with the translations
-----------------------------
To create a new translation, check that there are translations in GNOME
Aisleriot for that language and add the language code to LANGUAGES variable in
_translations.pri_. If you are just updating an existing translation you don't
need to edit _translations.pri_.

Run qmake and make to generate or update ts file. Edit _patience-deck\_XX.ts_
file with Qt Linguist to add your translations and run make again to generate qm
file and see that the content of the updated ts file is valid.

Then you may create a git commit to a new branch and push that to your fork of
the Github repository to create a PR. If you cloned this as part of Patience
Deck you may also want to build that to test your new translations.
