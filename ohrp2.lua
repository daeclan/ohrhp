function init()
  scroll_offset = 0
  -- sets scroll to 0, at  base
  data = {}
  -- creates a blank table named data
  for i = 1, 36 do
    data[i] = {}
    --tells the code to make 36 blank sub-tables, one for each column. 1 being the first column, 36 being the last (x values/horizontal).
    -- imagine this as an invisible, giant table. you are making it out to have 36 columns wide, 8 nodes high with 0 values at each node
    for j = 1, 8 do
      data[i][j] = 0
      --assigns 8 numbered pairs for each of the 36 sub-tables that will store the values of each column
    end
  end
  
  function make_note(x, y, z, midi, velocity, led)
    local note = {}
    note.x = x
    note.y = y
    note.z = z
    note.midi = midi
    note.velocity = velocity
    note.led = led
    return note
  end
  
  local box = {}
  
  box.note1 = make_note(1,6,0,36,127,8)
  box.note2 = make_note(2,6,0,37,127,3)
  box.note3 = make_note(2,7,0,38,127,8)
  box.note4 = make_note(3,7,0,39,127,3)
  box.note5 = make_note(3,8,0,40,127,8)
  box.note6 = make_note(4,8,0,41,127,8)
  box.note7 = make_note(4,7,0,42,127,3)
  box.note8 = make_note(5,7,0,43,127,8)
  box.note9 = make_note(5,6,0,44,127,3)
  box.note10 = make_note(6,6,0,45,127,8)
  box.note11 = make_note(6,5,0,46,127,3)
  box.note12 = make_note(7,5,0,47,127,8)
  box.note13 = make_note(8,5,0,48,127,8)
  box.note14 = make_note(9,5,0,49,127,3)
  box.note15 = make_note(9,6,0,50,127,8)
  box.note16 = make_note(10,6,0,51,127,3)
  box.note17 = make_note(10,7,0,52,127,8)
  box.note18 = make_note(11,7,0,53,127,8)
  box.note19 = make_note(11,6,0,54,127,3)
  box.note20 = make_note(12,6,0,55,127,8)
  box.note21 = make_note(12,5,0,56,127,3)
  box.note22 = make_note(13,5,0,57,127,8)
  box.note23 = make_note(13,4,0,58,127,3)
  box.note24 = make_note(14,4,0,59,127,8)
  box.note25 = make_note(15,4,0,60,127,8)
  box.note26 = make_note(16,4,0,61,127,3)
  box.note27 = make_note(16,5,0,62,127,8)
  box.note28 = make_note(17,5,0,63,127,3)
  box.note29 = make_note(17,6,0,64,127,8)
  box.note30 = make_note(18,6,0,65,127,8)
  box.note31 = make_note(18,5,0,66,127,3)
  box.note32 = make_note(19,5,0,67,127,8)
  box.note33 = make_note(19,4,0,68,127,3)
  box.note34 = make_note(20,4,0,69,127,8)
  box.note35 = make_note(20,3,0,70,127,3)
  box.note36 = make_note(21,3,0,71,127,8)
  box.note37 = make_note(22,3,0,72,127,8)
  box.note38 = make_note(23,3,0,73,127,3)
  box.note39 = make_note(23,4,0,74,127,8)
  box.note40 = make_note(24,4,0,75,127,3)
  box.note41 = make_note(24,5,0,76,127,8)
  box.note42 = make_note(25,5,0,77,127,8)
  box.note43 = make_note(25,4,0,78,127,3)
  box.note44 = make_note(26,4,0,79,127,8)
  box.note45 = make_note(26,3,0,80,127,3)
  box.note46 = make_note(27,3,0,81,127,8)
  box.note47 = make_note(27,2,0,82,127,3)
  box.note48 = make_note(28,4,0,83,127,8)
  box.note49 = make_note(29,4,0,84,127,8)
  box.note50 = make_note(30,2,0,85,127,3)
  box.note51 = make_note(30,3,0,86,127,8)
  box.note52 = make_note(31,3,0,87,127,3)
  box.note53 = make_note(31,4,0,88,127,8)
  box.note54 = make_note(32,4,0,89,127,8)
  box.note55 = make_note(32,3,0,90,127,3)
  box.note56 = make_note(33,3,0,91,127,8)
  box.note57 = make_note(33,2,0,92,127,3)
  box.note58 = make_note(34,2,0,93,127,8)
  box.note59 = make_note(34,1,0,94,127,3)
  box.note60 = make_note(35,1,0,95,127,8)
  box.note61 = make_note(36,1,0,96,127,8)

  print(box.note2.midi)
  g = grid.connect()
  -- connects the grid
  g.key = grid_key
  -- sets key press data to variable grid_key
  tab.print(box.note27)
  
end

function enc(n, d)
  if n == 1 then
    scroll_offset = util.clamp(scroll_offset + d, 0, 20)
    -- this takes the encoder 1 data and sets it to scroll between 0 & 20, clamped to that amount, as 20+16 is our magic number
  end
  grid_redraw()
  norns_redraw()
  -- each time the encoder is turned, it runs grid redraw
end

function grid_key(x, y, z)
  --when a key is pressed on the grid, it will pull in the coordinates x y and whether the butotn is pressed 1 or not 0
  data[x + scroll_offset][y] = z
  -- this is calling the table named "data," and using the grid_key data—-specifically the column number (x) and the row number [y] and setting it equal to z... why?
  grid_redraw()
  tab.print(data[36])
end

function grid_redraw()
  g:all(0)
  for x = 1, 16 do
    -- for the amount of visible columns
    for y = 1, 8 do
      -- set the led of the grid to match
      g:led(x + scroll_offset, y, data[x][y] == 1 and 15 or 0)
      -- x plus the scroll offset, the natural Y, and the data[i][j] at that specific coordinate
    end
  end
  g:refresh()
end

function norns_redraw()
  screen.clear()
  screen.move(32,16)
  screen.text(scroll_offset)
  screen.move(32,32)
  screen.text("OHRP II: OH RP")
  screen.update()
end