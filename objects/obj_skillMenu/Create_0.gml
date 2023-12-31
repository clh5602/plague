/// @description Insert description here
// You can write your code in this editor

function xPositionFormula(_y){
	return -0.0805555 * _y + global.dungeonPixelWidth - 163;
}

function yPositionFormula(_index){
	return 200 * _index + global.dungeonPixelHeight/2;
}

skillMenuList = [];

var selectedStruct = global.skillDatabase[global.player.skills[currentIndex]];
descriptionBox = instance_create_depth(global.dungeonPixelWidth * 0.05, global.dungeonPixelHeight * 0.7, depth - 20, obj_descriptionBox, {category : DROPS.skills, myStruct : selectedStruct});

for (var i = 0; i < array_length(global.player.skills); i++){
		var myY = yPositionFormula(i);
		array_push(skillMenuList, instance_create_layer(xPositionFormula(myY), myY, "Enemy", obj_skillMenuBlock, {myIndex: i, skill: global.skillDatabase[global.player.skills[i]], pauseMenu: pauseMenu}));
}

function performSkill(){
	if (skillDepth == -1){
		global.playerUP = round(global.playerUP - skill.cost);
		skillDepth = 0;
	}
	
	switch (skill.formula){
		
		case "HEAL":
			switch (skillDepth){
				case 0:
					skillDepth = 1;
					// create instance of item spotlight, pass in the item
					instance_create_depth(0, 0, depth - 20, obj_itemSpotlight, {myItem: skill, skill: true});
					break;
				case 1:
					if (!instance_exists(obj_itemSpotlight)){
						return true;	
					}
					break;
			}
			break;
		
		default:
			return true;
			break;
	}
	
	return false;
}