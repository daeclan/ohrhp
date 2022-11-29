-- ohrp
-- v0.0.2 @daeclan x rylee :)
-- tinyurl.com/yr5r8mbd
--

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
  g = grid.connect()
  -- connects the grid
  g.key = grid_key
  -- sets key press data to variable grid_key
  tab.print(data[1])
end

function enc(n, d)
  if n == 1 then
    scroll_offset = util.clamp(scroll_offset + d, 0, 20)
    -- this takes the encoder 1 data and sets it to scroll between 0 & 20, clamped to that amount, as 20+16 is our magic number
  end
  grid_redraw()
  redraw()
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

-- g.key = function(x,y,z)
--   if z==1 then engine.hz(100+x*4+y*64) end
--   g:led(x,y,z*15)
--   g:refresh()
-- end

function redraw()
  screen.clear()
  screen.move(32,16)
  screen.text(scroll_offset)
  screen.move(32,32)
  screen.text("OHRP II: OH RP")
  screen.update()
end
