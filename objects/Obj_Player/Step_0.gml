/// @description Every Step

switch (keyboard_key)
{
	// DIRECTIONAL CONTROLS
	
	// Consider changing grid size to avoid this 'divide by 2' work around
	
	case Obj_Control_Definitions.control_up: y -= TILE_SIZE / 2; break;
	case Obj_Control_Definitions.control_left: x -= TILE_SIZE / 2; break;
	case Obj_Control_Definitions.control_right: x += TILE_SIZE / 2; break;
	case Obj_Control_Definitions.control_down: y += TILE_SIZE / 2; break;
	
	// INTERACTION CONTROLS

	case Obj_Control_Definitions.interact:
	
		// PICKKUP FROM FLOOR
		if (place_meeting(x,y,Obj_Item))
		{
			var inst = instance_nearest(x,y,Obj_Item); // Get instance ID
			if (capacity > 0){
				inventory = inventory_Add(inventory, (inst).ItemID); // Copy item to inventory
				total_weight += Obj_Items_Master.ItemsMaster[(inst).ItemID][itemstats.weight];
				capacity -= 1;
				instance_destroy(inst);}
		} break;
}