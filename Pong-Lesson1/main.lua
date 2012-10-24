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