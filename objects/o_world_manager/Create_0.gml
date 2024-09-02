tileDraws = -1;
world = undefined;
grid_alpha = 0;
loadPercent = function(){
	return tileDraws / (WORLD_WIDTH + WORLD_HEIGHT)
}

enum STATE {
	wait,
	loading,
	unloading
}

state = STATE.unloading;

smallestX = 0;
largestX = WORLD_WIDTH;
smallestY = 0;
largestY = WORLD_HEIGHT;
global.selected_prinkle = -1;