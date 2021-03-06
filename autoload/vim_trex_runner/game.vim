
function! s:Initialize()
  call vim_trex_runner#ground#initialize_ground(g:vim_trex_runner#patterns#ground#frames, 1)
  call vim_trex_runner#trex#initialize_trex(g:vim_trex_runner#patterns#trex_running#frames, g:vim_trex_runner#patterns#trex_jumping#frames, 10)
  call vim_trex_runner#obstacles#initialize(g:vim_trex_runner#patterns#obstacles#frames)
  call vim_trex_runner#score_counter#initialize()

  let s:is_game_running = 1
  let s:timekeeper = 1
endfunction

function! s:Draw()
  let trex = vim_trex_runner#trex#get_trex_frame()
  let ground = vim_trex_runner#ground#get_ground_frame()
  let obstacles = vim_trex_runner#obstacles#get_frame()
  let canvas = vim_trex_runner#canvas#get_canvas(ground, trex, obstacles)

  let line_index = 1
  while line_index <= len(canvas)
    call setline(line_index, canvas[line_index-1])
    let line_index = line_index + 1
  endwhile
  redraw

  echo "Score: " . vim_trex_runner#score_counter#score()
endfunction

function! s:Update()
  let input = getchar(0)
  call vim_trex_runner#trex#handle_input(input, s:timekeeper)
  call vim_trex_runner#trex#update(s:timekeeper)
  call vim_trex_runner#obstacles#update()
  call vim_trex_runner#ground#update_ground(s:timekeeper)
  call vim_trex_runner#score_counter#update(s:timekeeper)
  let trex_frame = vim_trex_runner#trex#get_trex_frame()
  let obstacles_frame = vim_trex_runner#obstacles#get_frame()
  let s:is_game_running = !vim_trex_runner#collisions#detect(trex_frame, obstacles_frame)
  let s:timekeeper += 1
endfunction

function! vim_trex_runner#game#start()
  call s:Initialize()
  while s:is_game_running
    call s:Update()
    call s:Draw()
    sleep 1m
  endwhile
endfunction
