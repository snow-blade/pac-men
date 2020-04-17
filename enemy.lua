Enemy=Object:extend()
myFin=myFinder
assert(tilemap~=nil, "cc")
function Enemy:new(tile_x,tile_y)
	self.tile_x=tile_x
	self.tile_y=tile_y
	self.radius=16
	self.xcoords=self.tile_x*(self.radius*2)+16
	self.ycoords=self.tile_y*(self.radius*2)+16
	self.path=myFin:getPath(self.tile_x, self.tile_y, player.tile_x, player.tile_y)
	end
function Enemy:draw()
	love.graphics.circle("line", self.xcoords, self.ycoords,16)
end

function Enemy:update(dt)
	self.xcoords=self.tile_x*(self.radius*2)+16
	self.ycoords=self.tile_y*(self.radius*2)+16
	for node, count in self.path:nodes() do
		tick.update(dt)
		tick.delay(function ()
			self.tile_x= node:getX() self.tile_y= node:getY() end,1) end
end
function Enemy:follow()
   	for node, count in self.path:nodes() do
		tick.delay(function ( )
			self.tile_x= node:getX()
		    self.tile_y= node:getY()
		
		end,1) end
end