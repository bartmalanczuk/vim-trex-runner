function! vim_trex_runner#score_counter#initialize()
  let s:score = 0
endfunction

function! vim_trex_runner#score_counter#score()
  return s:score
endfunction

function! vim_trex_runner#score_counter#update(timekeeper)
  let s:score = (a:timekeeper/4)*10
endfunction
