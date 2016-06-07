function! vim_trex_runner#trex#initialize_trex(
  \ trex_running_frames,
  \ trex_jumping_frames,
  \ trex_running_frame_length
\ )
  call vim_trex_runner#trex_running#initialize(
    \ a:trex_running_frames,
    \ a:trex_running_frame_length
  \ )
  call vim_trex_runner#trex_jumping#initialize(
    \ a:trex_jumping_frames
  \ )
endfunction

function! vim_trex_runner#trex#update(timekeeper)
  call vim_trex_runner#trex_running#update(a:timekeeper)
  call vim_trex_runner#trex_jumping#update()
endfunction

function! vim_trex_runner#trex#handle_input(input, timekeeper)
  if(a:input == 32)
    call vim_trex_runner#trex_jumping#jump()
  endif
endfunction

function! vim_trex_runner#trex#get_trex_frame()
  if len(vim_trex_runner#trex_jumping#get_frame())
    return vim_trex_runner#trex_jumping#get_frame()
  else
    return vim_trex_runner#trex_running#get_frame()
  endif
endfunction
