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
  let line_index = 0
  while line_index < len(ground)
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
    let line_index = line_index + 1
  endwhile
  return ground
endfunction
