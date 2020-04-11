animator=require("animator")
local function leftan()
local one_left = love.graphics.newImage("1-left.png")
local two_left = love.graphics.newImage("2-left.png")
local three_left = love.graphics.newImage("3-left.png")
local four_left = love.graphics.newImage("4-left.png")
local five_left = love.graphics.newImage("5-left.png")
anim_left = animator.newAnimation( { one_left, two_left, three_left, four_left,five_left }, { 1, 1, 1, 1,1 })

anim_left:setLooping()

return anim_left

end
--
local function rightan()
local one = love.graphics.newImage("1.png")
local two = love.graphics.newImage("2.png")
local three = love.graphics.newImage("3.png")
local four = love.graphics.newImage("4.png")
local five = love.graphics.newImage("5.png")
anim_right = animator.newAnimation( { one, two, three, four,five }, { 1, 1, 1, 1,1 })

anim_right:setLooping()

return anim_right

end
--
local function abovean()
local one_above = love.graphics.newImage("1-above.png")
local two_above = love.graphics.newImage("2-above.png")
local three_above = love.graphics.newImage("3-above.png")
local four_above = love.graphics.newImage("4-above.png")
local five_above = love.graphics.newImage("5-above.png")
anim_above = animator.newAnimation( { one_above, two_above, three_above, four_above,five_above }, { 1, 1, 1, 1,1 })

anim_above:setLooping()

return anim_above

end
--
local function bottoman( ... )
local two_bottom = love.graphics.newImage("2-bottom.png")
local three_bottom = love.graphics.newImage("3-bottom.png")
local four_bottom = love.graphics.newImage("4-bottom.png")
local five_bottom= love.graphics.newImage("5-bottom.png")
anim_bottom = animator.newAnimation( { two_bottom, three_bottom, four_bottom,five_bottom }, {  1, 1, 1,1 })

anim_bottom:setLooping()

return anim_bottom

end
--
animationz={
anim_right=rightan(),
anim_left=leftan(),
anim_bottom=bottoman(),
anim_above=abovean()
}