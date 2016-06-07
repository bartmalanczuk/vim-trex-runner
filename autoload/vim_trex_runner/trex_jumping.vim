function! vim_trex_runner#trex_jumping#initialize(frames)
  let s:frames = a:frames
  let s:number_of_frames = len(s:frames)
  let s:current_frame_index = -1
  let s:velocity = 0
  let s:position = 0
  let s:gravity = 0.1
endfunction

function! vim_trex_runner#trex_jumping#jump()
  if s:position == 0
    let s:velocity = 2.6
  endif
endfunction

function! vim_trex_runner#trex_jumping#update()
  if s:position <= 0 && s:velocity <= 0
    let s:position = 0
    let s:velocity = 0
    let s:current_frame_index = -1
  else
    let s:current_frame_index = float2nr(s:position)
    let s:velocity = s:velocity - s:gravity
    let s:position = s:position + s:velocity
  endif
endfunction

function! vim_trex_runner#trex_jumping#get_frame()
  if s:current_frame_index == -1
    return []
  else
    return s:frames[s:current_frame_index]
  endif
endfunction
