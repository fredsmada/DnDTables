-----------------------------------------------------------------------------------------
--
-- view3.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
	function goBack()
		composer.removeScene( "view2")
		composer.gotoScene( "menu" )
	end

-- function to go to tables pop out view
	function tableMenu()
		composer.removeScene("view2")
		composer.gotoScene( "openMenu")
	end

local function onRowRender( event )
   local row = event.row
   local id = row.index

   row.nameText = display.newText( myData3[id].name, 12, 0, "Centaur", 17 )
   row.nameText.anchorX = 0
   row.nameText.anchorY = 0.5
   row.nameText:setFillColor( 0 )
   row.nameText.y = 20
   row.nameText.x = display.contentCenterX * 1.4
 
   row.costText = display.newText( myData3[id].cost, 12, 0, "Centaur", 17 )
   row.costText.anchorY = 0.5
   row.costText:setFillColor( 0, 0.25, 0.25, 1 )
   row.costText.y = 20
   row.costText.x = display.contentCenterX * 2.15
 
   row.dmgText = display.newText( myData3[id].damage, 12, 0, "Centaur", 17 )
   row.dmgText.anchorY = 0.5
   row.dmgText:setFillColor( 0, 0.5, 0.25, 1 )
   row.dmgText.y = 20
   row.dmgText.x = display.contentCenterX * 2.75
 
   row.weightText = display.newText( myData3[id].weight, 12, 0, "Centaur", 17 )
   row.weightText.anchorY = 0.5
   row.weightText:setFillColor( 0 )
   row.weightText.y = 20
   row.weightText.x = display.contentCenterX * 3.35
 
   row.specialText = display.newText( myData3[id].special, 12, 0, "Centaur", 17 )
   row.specialText.anchorY = 0.5
   row.specialText:setFillColor( 0 )
   row.specialText.y = 20
   row.specialText.x = display.contentCenterX * 4.6
 
   row:insert( row.nameText )
   row:insert( row.costText )
   row:insert( row.dmgText )
   row:insert( row.weightText )
   row:insert( row.specialText )
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


local options = {
	x = display.contentCenterX * 1.5,
	y = display.contentCenterY / 13,
	isEnabled = true,
	label = "Go Back",
	textOnly = true,
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.8 } },
	onPress = goBack
}

-- function to go to tables pop out view
	function tableMenu()
		composer.gotoScene( "openMenu")
	end

function scene:create( event )
	local sceneGroup = self.view
	-- Called when scene is created
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		-- mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
		-- sceneGroup:insert( mainGroup )  -- Insert into the scene's view group

		-- create a white background to fill screen
		background3 = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background3:setFillColor( 1 )	-- white

		title3 = display.newText( "Weapons Table", display.contentCenterX, display.contentCenterY / 4.5, "Centaur", 32 )
		title3:setFillColor( 0.7, 0.5, 0 )

		columnHeads8 = display.newText( "Name", display.contentCenterX * .2, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads8:setFillColor( 0 )
		columnHeads9 = display.newText( "Cost", display.contentCenterX * .8, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads9:setFillColor( 0 )
		columnHeads10 = display.newText( "Dmg", display.contentCenterX / .75, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads10:setFillColor( 0 )
		columnHeads11 = display.newText( "Weight", display.contentCenterX / .5, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads11:setFillColor( 0 )
		columnHeads12 = display.newText( "Special", display.contentCenterX / .3, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads12:setFillColor( 0 )

		underline3 = display.newLine( -50, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		underline3:setStrokeColor( 0 )

		local navBarHeight = 60
		local tabBarHeight = 50
		myList = widget.newTableView {
		   top = navBarHeight + 40, 
		   left = 0,
		   width = 1000, 
		   height = display.safeActualContentHeight - navBarHeight - tabBarHeight - 80,
		   onRowRender = onRowRender,
		   onRowTouch = onRowTouch,
		   listener = scrollListener
		}

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
		--tablesButton = widget.newButton(options2)
		view1backButton = widget.newButton(options)

		myList.x = 280

		myData3 = {}
		myData3[0] = {name="", cost="", damage="Simple Melee Weapons", weight="", special=""}
		myData3[1] = {name="Club", cost="1 sp", damage="1d4 blud", weight="2 lb", special="Light"}
		myData3[2] = {name="Dagger", cost="2 gp", damage="1d4 pier", weight="1 lb", special="Finesse, light"}
		myData3[3] = {name="Greatclub", cost="2 sp", damage="1d8 blud", weight="10 lb", special="2 handed"}
		myData3[4] = {name="Handaxe", cost="5 gp", damage="1d6 slas", weight="2 lb", special="Light, thrown (20/60)"}
		myData3[5] = {name="Javelin", cost="5 sp", damage="1d6 pier", weight="2 lb", special="Thrown (30/120)"}
		myData3[6] = {name="Light Hammer", cost="2 gp", damage="1d4 blud", weight="4 lb", special="Thrown (30/120)"}
		myData3[7] = {name="Mace", cost="5 gp", damage="1d6 blud", weight="4 lb", special="-"}
		myData3[8] = {name="Quarterstaff", cost="2 sp", damage="1d6 blud", weight="4 lb", special="Versatile (1d8)"}
		myData3[9] = {name="Sickle", cost="1 gp", damage="1d4 slas", weight="2 lb", special="Light"}
		myData3[10] = {name="Spear", cost="1 gp", damage="1d6 pier", weight="3 lb", special="Thrown (20/60), Versatile (1d8)"}
		myData3[11] = {name="", cost="", damage="Simple Ranged Weapons", weight="", special=""}
		myData3[12] = {name="Light Crossbow", cost="25 gp", damage="1d8 pier", weight="5 lb", special="(80/320), loading, 2 handed"}
		myData3[13] = {name="Dart", cost="5 cp", damage="1d4 pier", weight="1/4 lb", special="Finesse, thrown (20/60)"}
		myData3[14] = {name="Shortbow", cost="25 gp", damage="1d6 pier", weight="2 lb", special="(80/320), 2 handed"}
		myData3[15] = {name="Sling", cost="1 sp", damage="1d4 blud", weight="", special="(30/120)"}
		myData3[16] = {name="", cost="", damage="Martial Melee Weapons", weight="", special=""}
		myData3[17] = {name="Battleaxe", cost="10 gp", damage="1d8 slas", weight="4 lb", special="Versatile (1d10)"}
		myData3[18] = {name="Flail", cost="10 gp", damage="1d8 blud", weight="2 lb", special=""}
		myData3[19] = {name="Glaive", cost="20 gp", damage="1d10 slas", weight="6 lb", special="Heavy, Reach, 2 handed"}
		myData3[20] = {name="Greataxe", cost="30 gp", damage="1d12 slas", weight="7 lb", special="Heavy, 2 handed"}
		myData3[21] = {name="Greatsword", cost="50 gp", damage="2d6 slas", weight="6 lb", special="Heavy, 2 handed"}
		myData3[22] = {name="Halberd", cost="20 gp", damage="1d10 slas", weight="6 lb", special="Heavy, reach, 2 handed"}
		myData3[23] = {name="Lance", cost="10 gp", damage="1d12 pier", weight="6 lb", special="Reach, special"}
		myData3[24] = {name="Longsword", cost="15 gp", damage="1d8 slas", weight="3 lb", special="Versatile (1d10)"}
		myData3[25] = {name="Maul", cost="10 gp", damage="2d6 blud", weight="10 lb", special="Heavy, 2 handed"}
		myData3[26] = {name="Morningstar", cost="15 gp", damage="1d8 pier", weight="4 lb", special=""}
		myData3[27] = {name="Pike", cost="5 gp", damage="1d10 pier", weight="18 lb", special="Heavy, reach, 2 handed"}
		myData3[28] = {name="Rapier", cost="25 gp", damage="1d8 pier", weight="2 lb", special="Finesse"}
		myData3[29] = {name="Scimitar", cost="25 gp", damage="1d6 slas", weight="3 lb", special="Finesse, light"}
		myData3[30] = {name="Shortsword", cost="10 gp", damage="1d6 pier", weight="2 lb", special="Finesse, light"}
		myData3[30] = {name="Trident", cost="5 gp", damage="1d6 pier", weight="4 lb", special="(20/60), Versatile (1d8)"}
		myData3[31] = {name="War Pick", cost="5 gp", damage="1d8 pier", weight="2 lb", special="-"}
		myData3[32] = {name="Warhammer", cost="15 gp", damage="1d8 blud", weight="2 lb", special="Versatile"}
		myData3[33] = {name="Whip", cost="2 gp", damage="1d4 slas", weight="3 lb", special="Finesse, reach"}
		myData3[34] = {name="", cost="", damage="Martial Ranged Weapons", weight="", special=""}
		myData3[35] = {name="Blowgun", cost="10 gp", damage="1 pier", weight="1 lb", special="(25/100), loading"}
		myData3[36] = {name="Hand Crossbow", cost="75 gp", damage="1d6 pier", weight="3 lb", special="(30/120), light, loading"}
		myData3[37] = {name="Heavy Crossbow", cost="50 gp", damage="1d10 pier", weight="18 lb", special="(150/600), heavy, loading, 2 handed"}
		myData3[38] = {name="Longbow", cost="50 gp", damage="1d8 pier", weight="2 lb", special="(150/600), heavy, 2 handed"}
		myData3[39] = {name="Net", cost="1 gp", damage="-", weight="3 lb", special="Special, (5/15)"}
		
		for i = 1, #myData3 do
		    myList:insertRow{
		       rowHeight = 60,
		       isCategory = false,
		       rowColor = { 1, 1, 1 },
		       lineColor = { 0.90, 0.90, 0.90 }
		    }
		end

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background3 )
		scrollView:insert( title3 )
		scrollView:insert( underline3 )
		scrollView:insert( columnHeads8 )
		scrollView:insert( columnHeads9 )
		scrollView:insert( columnHeads10 )
		scrollView:insert( columnHeads11 )
		scrollView:insert( columnHeads12 )
		scrollView:insert( myList )
		scrollView:insert(view1backButton)
		--scrollView:insert(tablesButton)

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
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	columnHeads4:removeSelf()
	columnHeads5:removeSelf()
	columnHeads6:removeSelf()
	columnHeads7:removeSelf()
	view1backButton:removeSelf()
	--tablesButton:removeSelf()
	scrollView:remove( background3 )
	scrollView:remove( title3 )
	scrollView:remove( underline3 )
	scrollView:remove( myList )

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene