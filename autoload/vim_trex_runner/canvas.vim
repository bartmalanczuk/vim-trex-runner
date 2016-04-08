function! vim_trex_runner#canvas#get_canvas(ground, trex)
  let trex_padding_top = 5
  let trex_padding_left = 5
  let canvas = deepcopy(a:ground)
  for trex_line_index in [0, 1, 2, 3, 4, 5]
    let canvas_line_index = trex_line_index+trex_padding_top
    let trex_cells = split(a:trex[trex_line_index], '\zs')
    let this_or_trex = 'nr2char(or(char2nr(trex_cells[v:key]), char2nr(v:val)))'
    let trex_cells_matcher = '.\{'.trex_padding_left.'}\zs.\{10}'
    let background_cells = 'split(submatch(0), "\\zs")'
    let canvas[canvas_line_index] = substitute(
      \ canvas[canvas_line_index],
      \ trex_cells_matcher,
      \ '\=join(map(' . background_cells . ', "' . this_or_trex . '"), "")',
      \ ''
    \ )
  endfor
  return canvas
endfunction
