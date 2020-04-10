
function isEmpty(x, y)
    return tilemap[y][x] == 0
end
function love.load()
    animator=require("animator")
    sfx = love.audio.newSource("sfx.ogg", "static")
    --Load the image
    image = love.graphics.newImage("tileset.png")
    im= love.graphics.newImage("tile.png")
    --We need the full image width and height for creating the quads
    local image_width = image:getWidth()
    local image_height = image:getHeight()
    one = love.graphics.newImage("1.png")
    two = love.graphics.newImage("2.png")
    three = love.graphics.newImage("3.png")
    four = love.graphics.newImage("4.png")
    five = love.graphics.newImage("5.png")
    print(five:getHeight())
    anim = animator.newAnimation( { one, two, three, four,five }, { 1, 1, 1, 1,1 })
    anim:setLooping()
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
player = {
        image = love.graphics.newImage("player.png"),
        animation = anim,
        tile_x = 2,
        tile_y = 2
    }

end
function love.draw()
    for i,row in ipairs(tilemap) do
        for j,tile in ipairs(row) do
               if tile ~= 0 then
            
                   --Draw the image with the correct quad
                   love.graphics.draw(im, j * width, i * height)
               end    
           end
       end
       anim:draw(player.tile_x * width, player.tile_y * height,rotation,0.15,0.15)
       --Draw the player and multiple its tile position with the tile width and height
  --     love.graphics.draw(player.image, player.tile_x * width, player.tile_y * height)
end
function love.update(dt)
    anim:update( dt*10 )
end
function love.keypressed(key)
    local x = player.tile_x
    local y = player.tile_y

    if key == "d" then
        x = x - 1
    elseif key == "g" then
        x = x + 1
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