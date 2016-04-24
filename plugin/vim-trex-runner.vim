let s:is_game_running = 1
let s:timekeeper = 1

function! s:Initialize()
  call vim_trex_runner#ground#initialize_ground(g:vim_trex_runner#patterns#ground_frames, 40)
endfunction

function! s:Draw()
  let trex = vim_trex_runner#trex#get_trex_frame()
  let ground = vim_trex_runner#ground#get_ground_frame()
  let canvas = vim_trex_runner#canvas#get_canvas(ground, trex)

  for line in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    call setline(line, canvas[line-1])
  endfor
  redraw
endfunction

function! s:ProcessUserInput()
endfunction

function! s:Update()
  call vim_trex_runner#trex#update_trex(s:timekeeper)
  call vim_trex_runner#ground#update_ground(s:timekeeper)
  let s:timekeeper += 1
endfunction

function! Trex()
  new
  setlocal nowrap
  call s:Initialize()
  while s:is_game_running
    call s:Draw()
    call s:ProcessUserInput()
    call s:Update()
    sleep 1m
  endwhile
endfunction
