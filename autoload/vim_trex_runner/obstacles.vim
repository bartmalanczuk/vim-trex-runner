function! vim_trex_runner#obstacles#initialize(frames)
  let s:frames = a:frames
  let s:number_of_patterns = len(a:frames)
  let s:number_of_frames = len(a:frames[0])
  let s:current_pattern_index = 0
  let s:current_frame_index = -1
endfunction

function! vim_trex_runner#obstacles#update()
  if s:current_frame_index < s:number_of_frames - 1
    let s:current_frame_index = s:current_frame_index + 1
  else
    let s:current_frame_index = 0
    let s:current_pattern_index = str2nr(reltimestr(reltime())[-2:]) % s:number_of_patterns
    let s:number_of_frames = len(s:frames[s:current_pattern_index])
  endif
endfunction

function! vim_trex_runner#obstacles#get_frame()
  return s:frames[s:current_pattern_index][s:current_frame_index]
endfunction
