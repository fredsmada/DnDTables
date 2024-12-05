-----------------------------------------------------------------------------------------
--
-- openMenu.lua
--
-----------------------------------------------------------------------------------------

local widget = require( "widget" )
local composer = require( "composer" )
scene = composer.newScene()

	-- function to go to view
		function goToView1()
			composer.gotoScene( "openMenu" )
			composer.gotoScene( "view1" )
		end
	-- function to go to view
		function goToView2()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view2" )
		end
	-- function to go to view
		function goToView3()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view3" )
		end
	-- function to go to view
		function goToView4()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view4" )
		end
	-- function to go to view
		function goToView5()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view5" )
		end
	-- function to go to view
		function goToView6()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view6" )
		end
	-- function to go to view
		function goToView7()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view7" )
		end
	-- function to go to view
		function goToView8()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view8" )
		end
	-- function to go to view
		function goToView9()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view9" )
		end
	-- function to go to view
		function goToView10()
			composer.removeScene( "openMenu")
			composer.gotoScene( "view10" )
		end

	-- function to go to tables pop out view
	function tableMenu()
        composer.removeScene( "openMenu")
        composer.gotoScene( "view2" )
	end

	-- function to add scrollView to screen
		local scrollView = widget.newScrollView(
			{
			top = 0,
			left = 0,
			width = display.actualContentWidth,
			height = display.actualContentHeight,
			scrollWidth = display.actualContentWidth,
			scrollHeight = display.actualContentHeight,
			listener = scrollListener,
			setIsLocked = false,
			backgroundColor = { 1,1,1,1 }
			}
		)
		
		function scrollListener( event )
			local phase = event.phase
				if ( phase == "began" ) then print( "Scroll view was touched" )
				elseif ( phase == "moved" ) then print( "Scroll view was moved" )
				elseif ( phase == "ended" ) then print( "Scroll view was released" )
			end
		
			-- In the event a scroll limit is reached...
			if ( event.limitReached ) then
				if ( event.direction == "up" ) then print( "Reached bottom limit" )
				elseif ( event.direction == "down" ) then print( "Reached top limit" )
				elseif ( event.direction == "left" ) then print( "Reached right limit" )
				elseif ( event.direction == "right" ) then print( "Reached left limit" )
				end
			end
			return true
		end
	

function scene:create( event )
	sceneGroup = self.view

	-- mainGroup = display.newGroup()
	-- sceneGroup:insert(mainGroup )
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
end

function scene:show( event )
	sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		-- mainGroup = display.newGroup()
		-- sceneGroup:insert( mainGroup )

		-- Create a dark rectangle to show tables to choose from
		background = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
		background:setFillColor(0,0.5,1,1)    --blueish

        selections = display.newRect( display.contentCenterX / 1.5, display.contentCenterY / 1.3, display.actualContentWidth / 1.8, display.actualContentHeight / 1.7 )
		selections:setFillColor(0,0.5,1,1)    --bluish

		options2 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 13,
			isEnabled = true,
			label = "More Tables",
			labelColor = { default={ 1, 0, 1 }, over={ 0, 0, 1, 0.5 } },
			onPress = tableMenu
		}
		
		-- Buttons to manipulate list
		tablesButton = widget.newButton(options2)

		options5 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 5,
			isEnabled = true,
			label = "Experience",
			labelColor = { default={ 1,1,1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView1
		}options6 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 3,
			isEnabled = true,
			label = "Armor Table",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView2
		}options7 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 2.1,
			isEnabled = true,
			label = "Weapons Table",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView3
		}options8 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 1.6,
			isEnabled = true,
			label = "Treasure(CR 0-5)",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView4
		}options9 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 1.3,
			isEnabled = true,
			label = "Treasure(CR 6-10)",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView5
		}options10 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 1.1,
			isEnabled = true,
			label = "Treasure(CR 11-16)",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView6
		}options11 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY * 1.05,
			isEnabled = true,
			label = "Treasure(CR 17+)",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView7
		}options12 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY * 1.19,
			isEnabled = true,
			label = "Encounter Tracker",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView8
		}options13 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY * 1.32,
			isEnabled = true,
			label = "Monsters by Area",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView9
		}options14 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY * 1.45,
			isEnabled = true,
			label = "Monsters by CR",
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 1, 0.8 } },
			onPress = goToView10
		}

		-- Buttons to manipulate list
		view1backButton = widget.newButton(options)
		expButton = widget.newButton(options5)
		armorButton = widget.newButton(options6)
		weaponsButton = widget.newButton(options7)
		treasureButton1 = widget.newButton(options8)
		treasureButton2 = widget.newButton(options9)
		treasureButton3 = widget.newButton(options10)
		treasureButton4 = widget.newButton(options11)
		encounterButton = widget.newButton(options12)
		monsAreaButton = widget.newButton(options13)
		monsCRButton = widget.newButton(options14)

		-- all objects must be added to group (e.g. self.view)
		scrollView:insert(background)
		scrollView:insert(selections)
		scrollView:insert( view1backButton )
		scrollView:insert( tablesButton )
        scrollView:insert( expButton )
        scrollView:insert( armorButton )
        scrollView:insert( weaponsButton )
        scrollView:insert( treasureButton1 )
        scrollView:insert( treasureButton2 )
        scrollView:insert( treasureButton3 )
        scrollView:insert( treasureButton4 )
        scrollView:insert( encounterButton )
        scrollView:insert( monsAreaButton )
        scrollView:insert( monsCRButton )
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	sceneGroup = self.view
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
		scrollView:remove(background)
		scrollView:remove(selections)
		scrollView:remove( view1backButton )
        scrollView:remove( tablesButton )
        scrollView:remove( expButton )
        scrollView:remove( armorButton )
        scrollView:remove( weaponsButton )
        scrollView:remove( treasureButton1 )
        scrollView:remove( treasureButton2 )
        scrollView:remove( treasureButton3 )
        scrollView:remove( treasureButton4 )
        scrollView:remove( encounterButton )
        scrollView:remove( monsAreaButton )
        scrollView:remove( monsCRButton )
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene