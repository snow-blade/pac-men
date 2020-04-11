animator=require("animator")
local one = love.graphics.newImage("1.png")
local two = love.graphics.newImage("2.png")
local three = love.graphics.newImage("3.png")
local four = love.graphics.newImage("4.png")
local five = love.graphics.newImage("5.png")
local one_left = love.graphics.newImage("1-left.png")
local two_left = love.graphics.newImage("2-left.png")
local three_left = love.graphics.newImage("3-left.png")
local four_left = love.graphics.newImage("4-left.png")
local five_left = love.graphics.newImage("5-left.png")
anim_right = animator.newAnimation( { one, two, three, four,five }, { 1, 1, 1, 1,1 })
anim_right:setLooping()
anim_left = animator.newAnimation( { one_left, two_left, three_left, four_left,five_left }, { 1, 1, 1, 1,1 })
anim_left:setLooping()
animationz={
anim_right=anim_right,
anim_left=anim_left
}