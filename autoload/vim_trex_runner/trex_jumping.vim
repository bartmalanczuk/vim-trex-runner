function! vim_trex_runner#trex_jumping#initialize(frames, frame_length)
  let s:frames = a:frames
  let s:number_of_frames = len(s:frames)
  let s:frame_length = a:frame_length
  let s:jump_moment = -1
  let s:total_jump_time = s:frame_length*s:number_of_frames*2
  let s:current_frame_index = 0
endfunction

function! vim_trex_runner#trex_jumping#jump(timekeeper)
  if !s:is_jumping(a:timekeeper)
    let s:jump_moment = a:timekeeper
  endif
endfunction

function! vim_trex_runner#trex_jumping#update(timekeeper)
  if s:is_jumping(a:timekeeper)
    let jump_phase = (a:timekeeper-s:jump_moment) % s:total_jump_time
    if(jump_phase/s:frame_length > s:number_of_frames)
      let s:current_frame_index = 2*s:number_of_frames
        \ - jump_phase/s:frame_length - 1
    else
      let s:current_frame_index = jump_phase/s:frame_length - 1
    endif
  else
    let s:current_frame_index = -1
  endif
endfunction

function! vim_trex_runner#trex_jumping#get_frame()
  if s:current_frame_index == -1
    return []
  else
    return s:frames[s:current_frame_index]
  endif
endfunction

function! s:is_jumping(timekeeper)
  return s:jump_moment != -1 && s:jump_moment + s:total_jump_time > a:timekeeper
endfunction
