function! vim_trex_runner#collisions#detect(object, obstacle)
  let line_index = 0
  while line_index < len(a:object)
    let object_cells = split(a:object[line_index], '\zs')
    let obstacle_cells = split(a:obstacle[line_index], '\zs')
    if(map(object_cells, 'and(char2nr(v:val), char2nr(obstacle_cells[v:key]))')
      \ != repeat([10240], len(obstacle_cells)))
      return 1
    endif
    let line_index = line_index + 1
  endwhile
  return 0
endfunction
