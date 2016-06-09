function! s:EnvironmentSetup()
  tabedit
  setlocal nowrap
endfunction

function! s:EnvironmentLoop()
  let running = 1
  while running != 2
    call vim_trex_runner#game#start()
    let running = confirm("Game over. Do you want to play again?", "&Yes\n&No")
  endwhile
endfunction

function! s:EnvironmentDestroy()
  quit!
endfunction

function! vim_trex_runner#environment#start()
  call s:EnvironmentSetup()
  call s:EnvironmentLoop()
  call s:EnvironmentDestroy()
endfunction
