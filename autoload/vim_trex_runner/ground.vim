function! vim_trex_runner#ground#initialize_ground(ground_frames, line_length)
  let s:ground_frames = a:ground_frames
  let s:line_length = a:line_length
  let s:current_ground_frame = 0
  let s:ground_padding_left = 0
endfunction

function! vim_trex_runner#ground#update_ground(timekeeper)
  let s:current_ground_frame = (a:timekeeper/10)%2
  let s:ground_padding_left = (a:timekeeper/20)%(s:line_length + 1)
endfunction

function! vim_trex_runner#ground#get_ground_frame()
  let ground = copy(s:ground_frames[s:current_ground_frame])
  for line_index in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    let first_chars = matchstr(
      \ ground[line_index], '\zs.\{' . s:ground_padding_left .'}'
    \ )
    let ground[line_index] = substitute(
      \ ground[line_index],
      \ '\zs.\{' . s:ground_padding_left . '}',
      \ '',
      \ ''
    \ )
    let ground[line_index] = ground[line_index] . first_chars
  endfor
  return ground
endfunction
