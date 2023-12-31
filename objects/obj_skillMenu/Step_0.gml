// update description box
descriptionBox.myStruct = global.skillDatabase[global.player.skills[currentIndex]];

if (skillDepth >= 0){
	// execute item
	if (performSkill()) {
		skillDepth = -1;
	}
	exit;	
}

// Decrease the offset value
if (abs(offset) > 35){
	offset -= round(35 * sign(offset));
} else {
	offset = 0;
}

// Amount to draw for slider
top = sprite_height * (currentIndex - 2) / array_length(skillMenuList);
height = sprite_height * 5 / array_length(skillMenuList);

if (top < 0){
	height += top;
	top = 0;
}

if (top + height > sprite_height){
	height = sprite_height - top;
}


// Check for input
if (offset == 0) {
	
	
	// Check for confirm input
	if (keyboard_check_pressed(ord("Z"))){
		if (global.playerUP >= global.skillDatabase[global.player.skills[currentIndex]].cost){
			if (!pauseMenu) {
				creatorID.selectedSkill = global.player.skills[currentIndex];
				creatorID.skillMemory = currentIndex;
				creatorID.menuDepth = 3;
				instance_destroy(id);
			}
			else {
				skill = global.skillDatabase[global.player.skills[currentIndex]];
				if (skill.formula == "HEAL"){
					performSkill();
				}
			}
			exit;
		}
	}
	
	// Check for back input
	if (keyboard_check_pressed(ord("X"))){
		creatorID.menuDepth = -1;
		creatorID.skillMemory = currentIndex;
		instance_destroy(id);
		exit;
	}
	
	
	// Check for turn input
	if ((keyboard_check(vk_up)  || keyboard_check(ord("W"))) && currentIndex > 0){
		if (waitTimer <= 0){
			if (waitTimer == -1) waitTimer = 12;
			currentIndex--;
			offset = -200;
		}
		else {
			waitTimer--;
		}	
	}
	else if ((keyboard_check(vk_down)  || keyboard_check(ord("S"))) && currentIndex < array_length(skillMenuList) - 1){
		if (waitTimer <= 0){
			if (waitTimer == -1) waitTimer = 12;
			currentIndex++;
			offset = 200;
		}
		else {
			waitTimer--;
		}	
	}
	else {
		waitTimer = -1;	
	}
}


// Update menu stuff
for (var i = 0; i < array_length(skillMenuList); i++){
	var currentSkill = skillMenuList[i];
	currentSkill.y = yPositionFormula(i - currentIndex) + offset;
	currentSkill.x = xPositionFormula(currentSkill.y);
	currentSkill.menuIndex = currentIndex;
	skillMenuList[i].visible = true;
}