player={}
function player.new_player(image,animation,tile_x,tile_y)
	player={
		image=image,
		animation=animation,
		tile_x=tile_x,
		tile_y=tile_y
	} 
	return player
end
function player.draw()
   player.animation:draw(player.tile_x * width, player.tile_y * height,rotation,0.15,0.15)
end
function player.update(dt)
	 return   player.animation:update( dt*10 )
end