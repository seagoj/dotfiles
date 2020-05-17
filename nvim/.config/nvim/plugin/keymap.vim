" Mappings
let mapleader   = ","
let g:mapleader = ","
" Copy to clipboard
map         <leader>c       "+y
map         <leader>v       "+p
" Change CWD to directory of selected buffer
map         <leader>cd      :cd %:p:h<CR> :pwd<CR>
" Make directory for file in current buffer
map         <leader>md      :!mkdir -p %:p:h<CR>
" Toggle Invisible Whitespace Characters
map         <leader>l       :set list!<CR>
" Make buffers equal size
nmap        <leader>=       <C-w>=
nmap        <leader>w       :retab!<CR> :update!<CR>
map         <leader>ev      :tabnew $MYVIMRC<CR>
map         <leader>k       0y$:! open <C-r>"<CR>j<leader>k
map         <leader>tdd     :vsplit tests/%<CR>
nmap        <leader><space> :nohlsearch<CR>
" Moves current line up/down
nnoremap    <leader><Up>    :m-2<CR>
nnoremap    <leader><Down>  :m+1<CR>
" Align paragraph
map         <leader>ap      =ip
" Clone paragraph
map         <leader>cp      yap<S-}>p
" escape movement characters in insert mode
inoremap    jj              <Esc>jj
inoremap    kk              <Esc>kk
inoremap    jk              <Esc>
" outdent
vmap        <               <gv
" indent
vmap        >               >gv
" easier entry to commandmode
nnoremap    ;               :
nmap        p               ]p
" Disable ex mode
map         Q               <Nop>
" sudo write
cmap        w!!             w !sudo tee % >/dev/null
" snake_case to camel case
nnoremap    <leader>cc      EF_x~
" camelCase to snake_case
nnoremap    <leader>_       :s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g<CR>
" scroll 10 times faster
nnoremap    <C-e>           10<C-e>
nnoremap    <C-y>           10<C-y>
nnoremap    gV              `[v`]
" toggle folding with <Tab>
nmap        <Tab>           za
" show current filename
nmap        <leader>fn      :echo @%<CR>
nmap        <leader>fp      :let @" = expand("%:p")
" autoformt entire file
nnoremap    <leader><Tab>   <ESC>gg=G<C-o>zz
" navigate wrapped lines
map j gj
map k gk
" tab management
map <leader>tn  :tabnew<cr><c-p>
map <leader>to  :tabonly<cr>
map <leader>tc  :tabclose<cr>
map <leader>tm  :tabmove<space>
