--This is where we define the initial variables
function love.load()
	local f = love.graphics.newFont(36)
	red = love.graphics.newImage("assets/red-tile.png")
	blue = love.graphics.newImage("assets/blue-tile.png")
	green = love.graphics.newImage("assets/green-tile.png")
	yellow = love.graphics.newImage("assets/yellow-tile.png")

	love.graphics.setFont(f)
	love.graphics.setBackgroundColor(0,0,0)
	x, y = 100, 20
	love.graphics.setCaption("Tetris in Löve")
	love.graphics.setIcon(red)
	downLimit = love.graphics.getHeight() - red:getHeight()
	rightLimit = love.graphics.getWidth() - red:getWidth()

	mainSquare ={	100,20, 
					500, 20,
					500, 580,
					100, 580,
					100, 20
				}
end

--This is what is redrawn every
function love.draw()
	love.graphics.line(mainSquare)
	love.graphics.draw(red, x, y)
	love.graphics.draw(blue, x, y+red:getHeight())
	love.graphics.draw(green, x+red:getWidth(), y)
	love.graphics.draw(yellow, x+red:getWidth(), y+red:getHeight())
end

--This function updates the vaus for the drawing function
function love.update(dt)
	if love.keyboard.isDown("up") then
    	y = y - 400 * dt
   	end
   	if love.keyboard.isDown("down") then
    	y = y + 400 * dt
   	end
   	if love.keyboard.isDown("left") then
    	x = x - 400 * dt
   	end
   	if love.keyboard.isDown("right") then
    	x = x + 400 * dt
   	end
   	y = caida(y, dt)
   	limits()
end

--This is the function for the gravity effect
function caida(y, dt)
	return y + 100 * dt
end

-- Here we establish the limits of the object in the screen
function limits()
	if y < 0 then
		y = 0
    end
    if y > downLimit then
   		y = downLimit
   	end
   	if x < 0 then
   		x = 0
   	end
   	if x > rightLimit then
   		x = rightLimit
   	end
end

--This fucntion watches if 
function love.focus(f)
	if not f then
		print("Ventana en segundo plano")
	else
		print("Ventana en primer plano")
	end
end

--When the user closes the window
function love.quit()
	print("Juego cerrado")
end