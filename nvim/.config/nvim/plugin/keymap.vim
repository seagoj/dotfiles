" Mappings
let mapleader   = ","
let g:mapleader = ","
" Copy to clipboard
map         <leader>c       "+y
map         <leader>v       "+p
" Change CWD to directory of selected buffer
map         <leader>cd      :cd %:p:h<cr> :pwd<cr>
" Toggle Invisible Whitespace Characters
map         <leader>l       :set list!<cr>
" Make buffers equal size
nmap        <leader>=       <C-w>=
nmap        <leader>w       :retab!<cr> :update!<cr>
map         <leader>ev      :tabnew $MYVIMRC<cr>
map         <leader>k       0y$:! open <C-r>"<cr>j<leader>k
map         <leader>tdd     :vsplit tests/%<cr>
nmap        <leader><space> :nohlsearch<cr>
" Moves current line up/down
nnoremap    <leader><Up>    :m-2<cr>
nnoremap    <leader><Down>  :m+1<cr>
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
nnoremap    <leader>_       :s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g<cr>
" scroll 10 times faster
nnoremap    <C-e>           10<C-e>
nnoremap    <C-y>           10<C-y>
nnoremap    gV              `[v`]
" toggle folding with <Tab>
nmap        <Tab>           za
" show current filename
nmap        <leader>fn      :echo @%<CR>
" autoformt entire file
nnoremap    <leader><Tab>   <esc>gg=G<C-o>zz

" plugin
" - fzf.vim
nnoremap    <leader>p       :GitFiles --exclude-standard<cr>
nnoremap    <leader>/       :Find<space>
nnoremap    <leader>h       :BCommits<cr>
" - fugitive
nnoremap    <F3>            <Esc>:Git push<cr>
" - dash
nnoremap    <F12>           <Esc>:!Dash<cr>
" - nerdtree
nnoremap    <leader>o       <Esc>:NERDTreeToggle<cr>
" " - ctrl-p
" map         <leader>p       <Esc><c-p>
" - rainbow parenthesis
nnoremap    <leader>r       :RainbowParenthesesToggle<cr>

" file type
" render markdown
nmap        <leader>m       :!markdown %<cr>
