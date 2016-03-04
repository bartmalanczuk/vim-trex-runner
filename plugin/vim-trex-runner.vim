function! Trex()
  new
  while 1
    execute 'call setline(1, "' . strftime('%d/%m/%y %H:%M:%S') . '")'
    redraw
  endwhile
endfunction
