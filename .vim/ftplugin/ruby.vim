set tabstop=2

" http://d.hatena.ne.jp/babie/20110114/1294976877
" マジックコメントを挿入
function! MagicComment()
  return "# -*- coding: utf-8 -*-\<CR>"
endfunction

inoreabbrev <buffer> ## <C-R>=MagicComment()<CR>








