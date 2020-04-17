Player=Object:extend()
function Player:new(image,animation,tile_x,tile_y)
	self.image=image
	self.animation=animation
	self.tile_x=tile_x
	self.tile_y=tile_y
	self.im_rotation=0
end
function Player:draw( ... )
	self.animation:draw(self.tile_x * width, self.tile_y * height,self.im_rotation,0.15,0.15)
end
function Player:update(dt)
	player.animation:update( dt*20 )
end
