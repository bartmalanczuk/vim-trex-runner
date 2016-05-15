function! vim_trex_runner#canvas#get_canvas(ground, trex)
  let trex_padding_left = 5
  let canvas = deepcopy(a:ground)
  let trex_line_index = 0
  while trex_line_index < len(canvas)
    let canvas_line_index = trex_line_index
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
    let trex_line_index = trex_line_index + 1
  endwhile
  return canvas
endfunction
