function SetGolangOptions()

  " Break at lines and indent them by 2 spaces
  set textwidth=0
  set linebreak
  set breakindent
  set breakindentopt=shift:2

  let g:go_list_type = "quickfix"
  let g:go_fmt_command = "goimports"

  nmap <leader>r <Plug>(go-run)
  nmap <leader>t <Plug>(go-test)
  nmap <Leader>c <Plug>(go-coverage-toggle)
  nmap <Leader>i <Plug>(go-info)

  " run :GoBuild or :GoTestCompile based on the go file
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#cmd#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction

  nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

endfunction

autocmd Filetype go call SetGolangOptions()
