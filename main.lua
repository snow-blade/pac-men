
function slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end
  return sliced
end


function shuffle(tbl)
  love.math.getRandomSeed(os.time())
  for i = #tbl, 2, -1 do
    local j = love.math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
  return tbl
end
function isEmpty(x, y)
    return tilemap[y][x] == 0
end

function spawn_random_coins(tab,number_of_coins)
    pos={}
    table.insert(pos, {2,2})
    for i,el in ipairs(tab) do
       for j,el2 in ipairs(el) do 
           if el2==0 then
            table.insert(pos,{i,j})
              end
       end 
    end
    assert(number_of_coins<#pos,"the number of coins should be less than the numer of blanks")
    return slice(shuffle(pos),1,number_of_coins)
end
function love.load()
    require("animations")
    animator=require("animator")
    sfx = love.audio.newSource("sfx.ogg", "static")
    --Load the image
    image = love.graphics.newImage("tileset.png")
    im= love.graphics.newImage("tile.png")
    --We need the full image width and height for creating the quads
    local image_width = image:getWidth()
    local image_height = image:getHeight()
    
    --The width and height of each tile is 32, 32
    --So we could do:
    rotation=0
    width = 32
    height = 32

    --But let's say we don't know the width and height of a tile
    --We can also use the number of rows and columns in the tileset
    --Our tileset has 2 rows and 3 columns
    --But we need to subtract 2 to make up for the empty pixels we included to prevent bleeding
    width = (image_width / 3) - 2
    height = (image_height / 2) - 2

    --Create the quads
    quads = {}

    for i=0,1 do
        for j=0,2 do
            --The only reason this code is split up in multiple lines
            --is so that it fits the page
            table.insert(quads,
                love.graphics.newQuad(
                    1 + j * (width + 2),
                    1 + i * (height + 2),
                    width, height,
                    image_width, image_height))
        end
    end

    tilemap = {
    {1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 2},--1
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},--2
    {3, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 6, 0, 6, 6, 6, 6, 6, 6, 0, 6, 6, 0, 6, 6, 6, 6, 0, 3},--3
    {3, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 3},--4
    {3, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 6, 0, 6, 0, 0, 0, 0, 6, 0, 6, 6, 0, 6, 6, 6, 6, 0, 3},--5
    {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 0, 0, 0, 0, 6, 0, 6, 6, 0, 6, 6, 6, 6, 0, 3},--6
    {3, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 6, 0, 6, 0, 0, 0, 0, 6, 0, 6, 6, 0, 6, 0, 6, 6, 0, 3},--7
    {3, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 0, 0, 0, 0, 6, 0, 6, 6, 0, 6, 0, 6, 6, 0, 3},--8
    {3, 0, 6, 6, 0, 6, 6, 6, 6, 6, 6, 0, 6, 0, 6, 0, 0, 0, 0, 6, 0, 6, 6, 0, 6, 0, 6, 6, 0, 3},--9
    {3, 0, 6, 6, 0, 6, 6, 6, 6, 6, 6, 0, 6, 0, 6, 0, 0, 0, 0, 6, 0, 6, 6, 0, 6, 0, 0, 0, 0, 3},--10
    {3, 0, 6, 6, 0, 0, 0, 0, 0, 6, 6, 0, 6, 0, 6, 0, 0, 0, 0, 6, 0, 6, 6, 0, 6, 6, 6, 6, 0, 3},--11
    {3, 0, 6, 6, 0, 6, 6, 6, 0, 6, 6, 0, 6, 0, 6, 6, 6, 6, 6, 6, 0, 6, 6, 0, 6, 0, 0, 0, 0, 3},--12
    {3, 0, 6, 6, 0, 6, 6, 6, 0, 6, 6, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 3},--13
    {3, 0, 6, 6, 0, 0, 0, 0, 0, 6, 6, 0, 6, 0, 6, 0, 6, 0, 6, 0, 6, 0, 6, 0, 0, 0, 0, 0, 0, 3},--14
    {3, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 6, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 6, 0, 3},--15
    {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--17
    {3, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 6, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 3},
    {3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 3},--18
    {3, 0, 6, 0, 6, 0, 6, 0, 6, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3},--20
    {4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5},--21    
}
r=spawn_random_coins(tilemap,250)
player = {
        image = love.graphics.newImage("player.png"),
        animation=animationz.anim_right,
        tile_x = 2,
        tile_y = 2
    }
k=#r
end
function love.draw()
    for i,row in ipairs(tilemap) do
        for j,tile in ipairs(row) do
               if tile ~= 0 then
            
                   --Draw the image with the correct quad
                   love.graphics.draw(im, j * width, i * height)
               end    
             for k=1,#r do  
                for l=1,k do
               if i==r[k][l] and j==r[k][l+1] then
                            love.graphics.rectangle('fill', j*width+10, i*height+10, 10,10)
                         end end end
           end
       end
       player.animation:draw(player.tile_x * width, player.tile_y * height,rotation,0.15,0.15)
       --Draw the player and multiple its tile position with the tile width and height
  --     love.graphics.draw(player.image, player.tile_x * width, player.tile_y * height)
end
function love.update(dt)
    player.animation:update( dt*10 )
    for i=1,k do
              --[[  print("player.tile_x: "..tostring(player.tile_x))
                print("player.tile_y: "..tostring(player.tile_y))
                print("k"..tostring(k))
                print("r[k][l]: "..tostring(r[k][1]))
                print("r[k][l+1]: "..tostring(r[k][2])) ]]--
                if r[i]~=nil and player.tile_y==r[i][1] and player.tile_x==r[i][2] then 
                table.remove(r, i)
                i=1
                print("collision") 
               end  
        end
 end
function love.keypressed(key)
    local x = player.tile_x
    local y = player.tile_y

    if key == "d" then
        x = x - 1
        player.animation=animationz.anim_left
    elseif key == "g" then
        x = x + 1
        player.animation=animationz.anim_right
    elseif key == "r" then
        y = y - 1
    elseif key == "f" then
        y = y + 1
    end

   if isEmpty(x, y) then
        player.tile_x = x
        player.tile_y = y
    end
if key == "space" then
        sfx:play()
    end
end