Enemy=Object:extend()
function Enemy:new(tile_x,tile_y)
	self.tile_x=tile_x
	self.tile_y=tile_y
	self.radius=16
	self.xcoords=self.tile_x*(self.radius*2)+16
	self.ycoords=self.tile_y*(self.radius*2)+16
	self.path=myFinder:getPath(tile_x, tile_y, player.tile_x, player.tile_y)
end
function Enemy:draw()
	love.graphics.circle("line", self.xcoords, self.ycoords,16)
end
function Enemy:update(dt)
	self.xcoords=self.xcoords+dt*40
end
function Enemy:findpath()
	
end