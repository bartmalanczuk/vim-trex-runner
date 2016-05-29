function! vim_trex_runner#canvas#get_canvas(ground, trex, obstacles)
  let canvas = deepcopy(a:ground)
  let line_index = 0
  while line_index < len(canvas)
    let background_cells = split(canvas[line_index], '\zs')
    let trex_cells = split(a:trex[line_index], '\zs')
    let obstacles_cells = split(a:obstacles[line_index], '\zs')
    let get_resultant_cells = 'nr2char(or(char2nr(v:val), or(char2nr(trex_cells[v:key]), char2nr(obstacles_cells[v:key]))))'
    let canvas[line_index] = join(map(background_cells, get_resultant_cells), '')
    let line_index = line_index + 1
  endwhile
  return canvas
endfunction
