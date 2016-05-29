function! vim_trex_runner#ground#initialize_ground(ground_frames, frame_length)
  let s:ground_frames = a:ground_frames
  let s:current_ground_frame = 0
  let s:number_of_frames = len(s:ground_frames)
  let s:frame_length = a:frame_length
endfunction

function! vim_trex_runner#ground#update_ground(timekeeper)
  let s:current_ground_frame = (a:timekeeper/s:frame_length)%s:number_of_frames
endfunction

function! vim_trex_runner#ground#get_ground_frame()
  return s:ground_frames[s:current_ground_frame]
endfunction
