function! TodoToggle()
    :norm ma
    try
        :exec ":s/\\[ \\]/\\[x\\]/"
    catch
        :exec ":s/\\[x\\]/\\[ \\]/"
    finally
        :exec ":nohlsearch"
    endtry
    :norm `a
    :exec ":update"
endfunction

nmap <silent> x :call TodoToggle()<cr>
match none

