let s:current_trex_frame = 0

function! vim_trex_runner#trex#update_trex(timekeeper)
  if (a:timekeeper % 125) == 0
    let s:current_trex_frame = !s:current_trex_frame
  endif
endfunction

function! vim_trex_runner#trex#get_trex_frame()
  return g:vim_trex_runner#patterns#trex_frames[s:current_trex_frame]
endfunction
