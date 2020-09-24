/// @description Variable definitions and decision code

// FOR THE DEMO VERSION ALL NPC ATTRIBUTES ARE HARD CODED

NPC_name = "Gate Guard";

// NPC inventory. Everybody has something.
// This will be populated from a master NPC array similar to the items array
inventory = [];
for (var i = 0; i < 10; ++i;)
{inventory[i] = item.nothing;}

// NPC default dialogue choices, populated from NPC master array
dialogue_options = ["Hello","Who are you?","Open the gate!"];
options_count = 3;


// Evidence which the NPC can reveal
// Populated when a case starts, cleared when the case concludes
knowsabout = [];

// Dialogue function returns appropriate response to each topic,
// executes relevant actions, and updates topic array in dialogue 
// interface as needed
function dialogue(topic){
	switch(topic){
		case "Hello":
			Obj_Dialogue.dialogue_options[0] = "Don't you have a name?";
			Obj_Dialogue.responses = "Hello, yourself"; break;
		case "Who are you?":
			Obj_Dialogue.responses = "I'm the gate guard"; break;
		case "Open the gate!":
			if (has_item(item.passport,Obj_Player.inventory,Obj_Player.slots_filled) == true){
				Obj_Dialogue.responses = "You may pass";}
			else{
				Obj_Dialogue.responses = "You need a passport";}
			break;
		case "Don't you have a name?":
			Obj_Dialogue.responses = "Hell no, I don't"; break;
	}
}