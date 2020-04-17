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
	if self.path then
		print(('Path found! Length: %.2f'):format(self.path:getLength()))
	end
	for node, count in self.path:nodes() do
		print(('Step: %d - x: %d - y: %d'):format(count, node:getX(), node:getY()))
-	  end
	end
function Enemy:draw()
	love.graphics.circle("line", self.xcoords, self.ycoords,16)
end
function Enemy:update(dt)
	self.xcoords=self.xcoords+dt*40
end
function Enemy:findpath()
	
end