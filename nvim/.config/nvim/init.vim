" vim: sw=4 ts=4 noexpandtab:
lua require 'init'

function! Strip_trailing_whitespace(...)
	if &ft =~ 'markdown'
		return
	endif
	%s/\s\+$//e
endfunction
