" Mappings
let mapleader   = ","
let g:mapleader = ","
" Copy to clipboard
map         <leader>c       "+y
map         <leader>v       "+p
" Change CWD to directory of selected buffer
map         <leader>cd      :cd %:p:h<cr> :pwd<cr>
" Toggle Invisibles
map         <leader>l       :set list!<cr>
nmap        <leader>m       :!markdown %<cr>
nnoremap    <leader>o       <Esc>:NERDTreeToggle<cr>
map         <leader>p       <Esc><c-p>
nnoremap    <leader>r       :RainbowParenthesesToggle<cr>
nmap        <leader>w       :retab!<cr> :update!<cr>
map         <leader>ev      :tabnew $MYVIMRC<cr>
map         <leader>k       0y$:! open <C-r>"<cr>j<leader>k
nmap        <leader><space> :nohlsearch<cr>
" Moves current line up/down
nnoremap    <leader><Up>    :m-2<cr>
nnoremap    <leader><Down>  :m+1<cr>
" Align paragraph
map         <leader>ap      =ip
" Clone paragraph
map         <leader>cp      yap<S-}>p
imap        jj              <Esc>
imap        kk              <Esc>
vmap        <               <gv
vmap        >               >gv
nnoremap    ;               :
nmap        p               ]p
" Sudo write
cmap        w!!             w !sudo tee % >/dev/null
nnoremap    <F3>            <Esc>:Git push<cr>
nnoremap    <F12>           <Esc>:!Dash<cr>
nnoremap    <leader>b       F-vlUdl
