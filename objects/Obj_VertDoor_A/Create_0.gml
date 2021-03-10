/// @description Insert description here
// You can write your code in this editor

name = "Door";
passable = false;
locked = false;
hasInventory = false;
hasOptions = false;

alarm[0] = 1;

function access(){

	if (passable == false && locked == false){
		instance_destroy(Obj_Furniture_Manager);
		passable = true;
		sprite_index = Spr_VertDoor_A_Open;
		Obj_Player.control = true;
	}
	else if (passable == true){
		instance_destroy(Obj_Furniture_Manager);
		passable = false;
		sprite_index = Spr_VertDoor_A;
		Obj_Player.control = true;
	}
}