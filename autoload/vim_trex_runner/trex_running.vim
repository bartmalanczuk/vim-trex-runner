function! vim_trex_runner#trex_running#initialize(frames, frame_length)
  let s:current_frame_index = 0
  let s:frames = a:frames
  let s:frame_length = a:frame_length
endfunction

function! vim_trex_runner#trex_running#update(timekeeper)
  let s:current_frame_index = (a:timekeeper/s:frame_length)%2
endfunction

function! vim_trex_runner#trex_running#get_frame()
  return s:frames[s:current_frame_index]
endfunction
