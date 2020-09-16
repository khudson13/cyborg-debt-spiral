/// @description Insert description here
// You can write your code in this editor

inventory = Obj_Player.inventory; // Copy player inventory
display_height = 35; // Character tallness
selected_index = 0;  // Highlighted inventory index
selected_subindex = 1; // Highlighted submenu index
access = -1; // Keeps track of user menu selections, defaults to -1 for 'nothing'
subaccess = -1; // Menu selection tracker for sub menus

function inventory_Drop(droppingInstance,inventoryIndex,dropX,dropY){
	// Create new instance of dropped item at drop position
	global.CREATE_ID = droppingInstance.inventory[inventoryIndex];
	instance_create_layer(dropX,dropY,"Instances",Obj_Item);
	
	// Remove dropped item from inventory
	for (var i = inventoryIndex; i < droppingInstance.slots_filled; ++i;){
		droppingInstance.inventory[i] = droppingInstance.inventory[i + 1];
	}
	
	droppingInstance.slots_filled -= 1;
}