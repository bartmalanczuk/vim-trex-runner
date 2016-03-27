function! s:SetDefaults()
  let s:is_game_running = 1
  let s:timekeeper = 1
  let s:current_trex_frame = 0
  let s:trex_frames = g:vim_trex_runner#patterns#trex_frames
endfunction

function! s:Draw()
  for line in [1, 2, 3, 4, 5, 6]
    call setline(line, s:trex_frames[s:current_trex_frame][line-1])
  endfor
  redraw
endfunction

function! s:ProcessUserInput()
endfunction

function! s:ProcessLoopParameters(life_time)
  if s:timekeeper > a:life_time
    let s:is_game_running = 0
  endif
endfunction

function! s:UpdateTrex()
  let s:current_trex_frame = !s:current_trex_frame
endfunction

function! s:Update()
  if (s:timekeeper % 125) == 0
    call s:UpdateTrex()
  endif
  let s:timekeeper += 1
endfunction

function! Trex()
  call s:SetDefaults()
  new
  while s:is_game_running
    call s:Draw()
    call s:ProcessUserInput()
    call s:Update()
    sleep 1m
  endwhile
endfunction

function! GetTrexFrame(life_time)
  call s:SetDefaults()
  while s:is_game_running
    call s:Draw()
    call s:ProcessLoopParameters(a:life_time)
    call s:Update()
  endwhile
endfunction
