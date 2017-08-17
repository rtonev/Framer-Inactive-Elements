# Create overlay that is hidden by default. It will move around the screen and change its size 
# for each element, makred as inactive
temp_overlay = new Layer
	z: 99999
	visible: false
	backgroundColor: "#1199EE"	
	opacity: 0.5
	
# Check if the object is of type array. Function adopted by Douglas Crockford (http://crockford.com/)
isArray = ( value ) ->
    value and
        typeof value is 'object' and
        value instanceof Array and
        typeof value.length is 'number' and
        typeof value.splice is 'function' and
        not ( value.propertyIsEnumerable 'length' )

# Mark passed object(s) as inactive. The function can accept arrays or variables       
exports.add = (inactiveObjects) ->
	if isArray(inactiveObjects)
		for obj in inactiveObjects		
			setupListener(obj)
	else 
		print "else case"
		setupListener(inactiveObjects)		

# On click, move the overlay to the element, match its size, and show it for 0.3 sec
setupListener = (obj) ->
	obj.on Events.Click, (event, layer) ->
		temp_overlay.size = this.size
		temp_overlay.x = this.x
		temp_overlay.y = this.y
		temp_overlay.parent = this.parent
		temp_overlay.visible = true
		Utils.delay 0.3, ->
			temp_overlay.visible = false	
