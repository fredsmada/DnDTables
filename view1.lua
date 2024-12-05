-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------
--***TODO: cannot view experience table more than 1 time without
-- messing up menu
local widget = require( "widget" )
local composer = require( "composer" )
scene = composer.newScene()

	-- function to go back
		function goBack()
			composer.removeScene( "view1")
			composer.gotoScene( "menu" )
		end
	-- -- function to go to view
	-- 	function goToView1()
	-- 		--composer.gotoScene( "view1" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView2()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view2" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView3()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view3" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView4()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view4" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView5()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view5" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView6()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view6" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView7()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view7" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView8()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view8" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView9()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view9" )
	-- 	end
	-- -- function to go to view
	-- 	function goToView10()
	-- 		composer.removeScene( "view1")
	-- 		composer.gotoScene( "view10" )
	-- 	end

	-- function to go to tables pop out view
	function tableMenu()
		composer.removeScene("view1")
		composer.gotoScene( "openMenu")
	end

local options = {
	x = display.contentCenterX * 1.5,
	y = display.contentCenterY / 13,
	isEnabled = true,
	label = "Go Back",
	textOnly = true,
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.8 } },
	onPress = goBack
}

local function onRowRender( event )
   local row = event.row
   local id = row.index
 
   row.nameText = display.newText( myData[id].name, 12, 0, "Centaur", 20 )
   row.nameText.anchorX = 0
   row.nameText.anchorY = 0.5
   row.nameText:setFillColor( 0 )
   row.nameText.y = 20
   row.nameText.x = 100
 
   row.valueText = display.newText( myData[id].value, 12, 0, "Centaur", 20 )
   row.valueText.anchorY = 0.5
   row.valueText:setFillColor( 0, 0.25, 0.25, 1 )
   row.valueText.y = 20
   row.valueText.x = 230
 
   row.proficiencyText = display.newText( myData[id].proficiency, 12, 0, "Centaur", 20 )
   row.proficiencyText.anchorY = 0.5
   row.proficiencyText:setFillColor( 0, 0.5, 0.25, 1 )
   row.proficiencyText.y = 20
   row.proficiencyText.x = 355
 
   row:insert( row.nameText )
   row:insert( row.valueText )
   row:insert( row.proficiencyText )
   return true
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

	sceneGroup:insert( scrollView )  -- Insert into the scene's view group
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
end

function scene:show( event )
	sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		-- mainGroup = display.newGroup()
		-- sceneGroup:insert( mainGroup )

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

		-- create a white background to fill screen
		background = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background:setFillColor( 1 )	-- white

		local options2 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 13,
			isEnabled = true,
			label = "More Tables",
			textOnly = true,
			labelColor = { default={ 1, 0, 1 }, over={ 0, 0, 1, 0.5 } },
			onPress = tableMenu
		}
		
		-- Buttons to manipulate list
		tablesButton = widget.newButton(options2)

		title = display.newText( "Experience Table", display.contentCenterX, display.contentCenterY / 4.5, "Centaur", 32 )
		title:setFillColor( 0.7, 0.5, 0 )

		columnHeads = display.newText( "Level", display.contentCenterX / 5, display.contentCenterY / 2.5, "Centaur", 22 )
		columnHeads:setFillColor( 0 )
		columnHeads2 = display.newText( "Experience", display.contentCenterX / 1.15, display.contentCenterY / 2.5, "Centaur", 22 )
		columnHeads2:setFillColor( 0 )
		columnHeads3 = display.newText( "Pro Bonus", display.contentCenterX * 1.65, display.contentCenterY / 2.5, "Centaur", 22 )
		columnHeads3:setFillColor( 0 )

		-- underline = display.newLine( -100, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		-- underline:setStrokeColor( 0 )

		view1backButton = widget.newButton(options)

		myList = widget.newTableView {
		   top = display.contentCenterY * .5, 
		   left = display.contentCenterX * -0.5,
		   width = display.actualContentWidth * 1.25, 
		   height = display.actualContentHeight / 1.5,
		   onRowRender = onRowRender,
		   onRowTouch = onRowTouch,
		   listener = scrollListener
		}

		myData = {}
		myData[1] = { name="1", value="0", proficiency="+2" }
		myData[2] = { name="2", value="300", proficiency="+2" }
		myData[3] = { name="3", value="900", proficiency="+2" }
		myData[4] = { name="4", value="2,700", proficiency="+2" }
		myData[5] = { name="5", value="6,500", proficiency="+3" }
		myData[6] = { name="6", value="14,000", proficiency="+3" }
		myData[7] = { name="7", value="23,000", proficiency="+3" }
		myData[8] = { name="8", value="34,000", proficiency="+3" }
		myData[9] = { name="9", value="48,000", proficiency="+4" }
		myData[10] = { name="10", value="64,000", proficiency="+4" }
		myData[11] = { name="11", value="85,000", proficiency="+4" }
		myData[12] = { name="12", value="100,000", proficiency="+4" }
		myData[13] = { name="13", value="120,000", proficiency="+5" }
		myData[14] = { name="14", value="140,000", proficiency="+5" }
		myData[15] = { name="15", value="165,000", proficiency="+5" }
		myData[16] = { name="16", value="195,000", proficiency="+5" }
		myData[17] = { name="17", value="225,000", proficiency="+6" }
		myData[18] = { name="18", value="265,000", proficiency="+6" }
		myData[19] = { name="19", value="305,000", proficiency="+6" }
		myData[20] = { name="20", value="355,000", proficiency="+6" }
		 
		for i = 1, #myData do
		   myList:insertRow{
		      rowHeight = 60,
		      isCategory = false,
		      rowColor = { 1, 1, 1 },
		      lineColor = { 0.90, 0.90, 0.90 }
		   }
		end
		-- all objects must be added to group (e.g. self.view)
		scrollView:insert( background )
		scrollView:insert( title )
		scrollView:insert( myList )
		scrollView:insert( columnHeads )
		scrollView:insert( columnHeads2 )
		scrollView:insert( columnHeads3 )
		scrollView:insert( view1backButton )
		scrollView:insert( tablesButton )
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
	-- scrollView:remove( view1backButton )
	-- scrollView:remove( tablesButton )
	-- scrollView:remove( background )
	-- scrollView:remove( underline )
	-- scrollView:remove( title )
	-- scrollView:remove( myList )
	-- columnHeads:removeSelf()
	-- columnHeads2:removeSelf()
	-- columnHeads3:removeSelf()
	-- view1backButton:removeSelf()
	-- tablesButton:removeSelf()
	-- scrollView:removeSelf()
	-- myList.isVisible = false
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene