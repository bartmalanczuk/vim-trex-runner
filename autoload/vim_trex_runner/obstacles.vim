function! vim_trex_runner#obstacles#initialize(frames, frame_duration)
  let s:frames = a:frames
  let s:number_of_frames = len(a:frames)
  let s:current_frame_index = 0
  let s:frame_duration = a:frame_duration
endfunction

function! vim_trex_runner#obstacles#update(timekeeper)
  let s:current_frame_index = (a:timekeeper/s:frame_duration)%s:number_of_frames
endfunction

function! vim_trex_runner#obstacles#get_frame()
  return s:frames[s:current_frame_index]
endfunction
