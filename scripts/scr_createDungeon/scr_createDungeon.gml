global.xPos = 1;
global.yPos = 1;
global.dungeonFloor = 1;
global.dungeonAmountOfFloors = 4;
global.facing = 1;
global.maxCool = 18;
global.turnAnimation = 0;
global.walkForTime = 12;
global.encounterTimer = 100;
global.clearCondition = 0;
global.idleTimer = 0;
global.exitOpen = true; // floor key or boss req
global.dungeonChests = []; // chests reference this array for their contents
global.dungeonShop = []; // similar to chests
global.dungeonNPC = []; // stores npc messages

global.shopkeeperSprite = pointer_null;

global.keyStruct = {
	myName: "Floor Key",
	description: "Opens the exit on this floor."
}

global.clearConditionTexts = [
	"Find the exit!",
	"Find the key!",
	"Find and defeat the boss!"
];

randomize();

global.battleCursorMemory1 = 4;

/* Default	// For Walls -> 0 is Display sprite, 1 is Function. If function is odd, solid wall
			// For Tiles -> 0 is Floor Sprite, 1 is Ceiling Sprite, 2 is Function
global.dungeon = [
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []]
];*/

/* 
// wall actions
enum WALL
{
	none,		// 0
	stop,		// 1
	stairs,		// 2
	locked,		// 3
	shop,		// 4
	chest,		// 5
	emptyChest,	// 6
	npc,		// 7
	boss		// 8
}
*/

global.dungeon = [];

function loadFloor(_floor){
	
	// make locked doors closed
	global.exitOpen = false;
	
	global.clearCondition = CLEAR.none;
	
	switch (_floor) {
		
		case 1:
			// First floor, sewer?
			
			// load palette
			
			
			global.dungeonNPC = [
				["Welcome to Plague!", "Your goal here is to reach the top of this dungeon.", "Each floor has an exit staircase, and this dungeon happens to have 4 floors.", "Good luck reaching the exit! And watch out for monsters!"],
				["Each floor can have a variety of treasures on it.", "Opening chests can even result in learning new skills for battle!", "It might be wise to loot an entire floor before moving on to the next."]
			];
			global.dungeonChests = [
				[DROPS.consumables, 0, 4], // four potions
				[DROPS.skills, 5, 1], // ignis
				[DROPS.skills, 12, 1] // sana
			];
			
			global.dungeon = [
			[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 9, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 4], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
			[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 4], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
			[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1]],
			[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,50],      [],    [ 1, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1]],
			[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],   [ 9, 70],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1]],
			[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      []],
			[ [ 1, 1], [ 5, 7, 0],[ 9, 52], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1]],
			[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,51],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 0],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1]],
			[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],   [ 9, 71],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9, 2],      [],    [ 1, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1]],
			[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      []]
			];
			
			global.xPos = 5;
			global.yPos = 1;
			global.facing = 1;
			
			break;
			
		case 2:
		
			global.clearCondition = CLEAR.key;
			
			// Second floor, corn maze
			global.dungeonNPC = [
				["On some floors, opening the way to the exit may require some work.", "On this floor, the door to the exit is locked.", "You'll need to find the key somewhere on this floor before moving on."],
				["Sometimes, these dungeons will house false walls.", "False walls look exactly like your everyday wall, but you can actually walk right through them.", "False walls will appear as empty on the map, so it may prove wise to watch your mini map."],
				["It's always possible to use items and skills outside of battle.", "By pressing ENTER, you can bring up the pause menu.", "From here, you can use healing items and skills at your heart's content."]
			];
			global.dungeonChests = [
				[DROPS.key, 0, 1], // key
				[DROPS.skills, 6, 1], // fulgur
				[DROPS.skills, 2, 1], // brute force
				[DROPS.consumables, 0, 4] // potions
			];
			global.dungeonShop = [
				[DROPS.consumables, 0, getCost(0)], // potions
				[DROPS.consumables, 1, getCost(1)], // elixers
				[DROPS.skills, 3, 100], // hawk strike
				[DROPS.skills, 10, 135] // orandi
			];
			
			global.shopkeeperSprite = spr_shopkeeperScarecrow;
			
			
			global.dungeon = [
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 3, 0],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 3, 0], [ 5, 8, 0], [ 3, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 3, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 9, 4],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 3, 0],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 1, 1], [ 5, 7, 0], [ 9, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [11, 3], [ 5, 7, 0], [ 3, 0], [ 5, 8, 4], [ 3, 0], [ 5, 7, 4], [ 0, 0], [ 5, 7, 4], [ 0, 0], [ 5, 7, 4], [ 0, 0], [ 5, 7, 4], [ 9, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 3, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 9, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 9, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 9, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []]
			];
			
			global.xPos = 21;
			global.yPos = 9;
			global.facing = 3;
			
			break;
			
		case 3:
		
			// Floor 3, ?
			global.dungeon = [
				[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],     [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1],  [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 9, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],     [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1],  [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],     [ 1, 1],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0],  [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],     [ 0, 0],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1],  [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 9, 0],      [],     [ 0, 0],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0],  [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],     [ 0, 0],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 1, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 5, 7, 0], [ 9, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1],  [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],     [ 0, 0],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1],  [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],     [ 0, 0],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 9, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 9, 0], [ 5, 7, 0], [ 0, 0],  [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],     [ 1, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1],  [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],     [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1],  [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],     [ 0, 1],      []]
			];
			
			global.xPos = 3;
			global.yPos = 15;
			global.facing = 1;
			
			break;
		
	}
	
}