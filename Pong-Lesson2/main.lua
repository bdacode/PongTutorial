-- Abstract: Pong sample project
--
-- Demonstrates multitouch and draggable phyics objects 
--
-- Main 1
-- Version: 1.0
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
--
-- History
--  1.0		10/16/12		Initial version
-------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

local _W = display.contentWidth
local _H = display.contentHeight

local radius = 15			-- radius of the ball
local paddleHeight = 65		-- height of the paddles
local velocity = 200		-- Determines speed of ball

-- Add background image and table net
local bkg = display.newImage( "paper_bkg.png", true )
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

local tableNet = display.newImage( "tableNet.png", true )
tableNet.x = display.contentCenterX
tableNet.y = display.contentCenterY

-- Create two paddles and place them on the screen
local paddle1 = display.newRect( 40, 20, 15, paddleHeight )
local paddle2 = display.newRect( 440, 20, 15, paddleHeight )

-- Create new ball in center of the table
local function newBall()
	ball = display.newImage( "puck_yellow.png" )
	ball.x = _W/2		-- center it
	ball.y = _H/2
	ball:scale( 0.2, 0.2 )

end

-- Remove the ball from the table
local function removeBall()
	ball:removeSelf()
end

newBall()		-- create new ball and start game

--transition.to( ball, {time = 1000, x = 440, y = 300} )

system.activate( "multitouch" )

-- A basic function for dragging paddle objects up and down
local function startDrag( event )
	local t = event.target
	local phase = event.phase
	
	if "began" == phase then
		display.getCurrentStage():setFocus( t, event.id )
		t.isFocus = true

		-- Store initial position
		t.x0 = event.x - t.x
		t.y0 = event.y - t.y

	elseif t.isFocus then
		if "moved" == phase then
			-- check to make sure the paddle stays on the screen
			if event.y - t.y0 > 20 and event.y - t.y0 < _H-20 then 
				t.y = event.y - t.y0
			end

		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false

		end
	end

	-- Stop further propagation of touch event!
	return true
end

paddle1:addEventListener( "touch", startDrag ) -- make object draggable
paddle2:addEventListener( "touch", startDrag ) -- make object draggable
