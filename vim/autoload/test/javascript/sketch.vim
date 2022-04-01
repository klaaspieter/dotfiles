if !exists('g:test#javascript#sketch#file_pattern')
  let g:test#javascript#sketch#file_pattern = '\v(__tests__/.*|(spec|test))\.(js|jsx|coffee|ts|tsx)$'
endif

function! test#javascript#sketch#test_file(file) abort
  if !filereadable('package.json')
    return 0
  endif

  let l:packages = readfile('package.json')

  if exists('*json_decode')
    let l:dict = json_decode(join(packages, ''))

    return get(dict, 'name') =~ 'sketch-cloud-frontend'
  endif

  return 0
endfunction

function! test#javascript#sketch#build_position(type, position) abort
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      let name = '-t '.shellescape(name, 1)
    endif
    return [name, a:position['file']]
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

let s:yarn_command = '\<yarn\>'
function! test#javascript#sketch#build_args(args) abort
  if exists('g:test#javascript#sketch#executable')
    \ && g:test#javascript#sketch#executable =~# s:yarn_command
    return filter(a:args, 'v:val != "--"')
  else
    return a:args
  endif
endfunction

function! test#javascript#sketch#executable() abort
  return 'yarn test --watchAll=false'
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#javascript#patterns)
  return (len(name['namespace']) ? '^' : '') .
       \ test#base#escape_regex(join(name['namespace'] + name['test'])) .
       \ (len(name['test']) ? '$' : '')
endfunction
