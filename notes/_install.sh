. $HOME/functions/dotfiles.sh

dotfiles::update_repo gitlab:/seagoj/notes.git notes && popd

if [[ ! -L "${HOME}"/notes ]]; then
	ln -s "${CODE:-${HOME}/code}"/notes "${HOME}"/notes
fi
