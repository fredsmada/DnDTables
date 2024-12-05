-----------------------------------------------------------------------------------------
--
-- encounter.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

function scene:create( event )
	local sceneGroup = self.view
	-- Called when scene is created
end

function nextCharacter()

end

function goBack()
	composer.removeScene( "Previous" )
	composer.gotoScene( "view8" )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
 
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		mainGroup = display.newGroup() 
		sceneGroup:insert( mainGroup )

		-- create a white background to fill screen
		background = display.newRect( display.contentCenterX, display.contentCenterY, display.safeActualContentWidth, display.safeActualContentHeight )
		background:setFillColor( 0 )

		title = display.newText( "Initiative Tracker", display.contentCenterX, display.contentCenterY - 140, "Centaur", 32 )
		title:setFillColor( 0.7, 0, 0 )

		options = {
			x = 50,
			y = 100,
			isEnabled = true,
			label = "Next",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.25 } },
			onPress = nextCharacter
		}

		-- Button to add character to list
		nextButton = widget.newButton(options)

		options2 = {
			x = 50,
			y = 180,
			isEnabled = true,
			label = "Back",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.25 } },
			onPress = goBack
		}

		-- Button to add character to list
		backButton = widget.newButton(options2)

		-- Boxes to make button look more like a button
		local buttonBox = display.newRect( 50, 100, 140, 45 )
		buttonBox:setFillColor( 1,0,0,0.5 )
		local buttonBox2 = display.newRect( 50, 180, 140, 45 )
		buttonBox2:setFillColor( 1,0,0,0.5 )

		-- Create text box to show encounter order
		encounterList = native.newTextBox(display.contentCenterX, display.contentCenterY - 50, 200, 200)
		encounterList.text = event.params
		encounterList.isEditable = true
		encounterList.size = 30

		-- for key, value in pairs(event.params) do
		--     print(key, " -- ", value)
		-- end

	    -- all objects must be added to group (e.g. self.view)
		mainGroup:insert( background )
		mainGroup:insert( title )
		mainGroup:insert( nextButton )
		mainGroup:insert( backButton )
		mainGroup:insert( buttonBox )
		mainGroup:insert( buttonBox2 )
		mainGroup:insert( encounterList )

	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
		display.remove(title)
		display.remove(background)
		display.remove(buttonBox)
		display.remove(buttonBox2)
		display.remove(nextButton)
		display.remove(backButton)
		display.remove(encounterList)
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene