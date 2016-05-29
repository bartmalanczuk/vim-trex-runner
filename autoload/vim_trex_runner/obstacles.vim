function! vim_trex_runner#obstacles#initialize(frames, line_length)
  let s:frames = a:frames
  let s:number_of_frames = len(a:frames)
  let s:line_length = a:line_length
  let s:current_frame_index = 0
endfunction

function! vim_trex_runner#obstacles#update(timekeeper)
  let s:current_frame_index = (a:timekeeper/2)%s:number_of_frames
endfunction

function! vim_trex_runner#obstacles#get_frame()
  return s:frames[s:current_frame_index]
endfunction
