var iid = 0;
global.ITEMS = [
	new Item("Grass", "Ground", "A soft patch of grass, with no other items on top", 0, undefined, 0),
	new Item("River", "Ground", "A gentle stream", 1, o_river, 0),
	new Item("Lake", "Ground", "A still pond", 2, o_lake, 0),
	new Item("Oak Planks", "Ground", "A still pond", 3, o_oak_planks, 0),
	new Item("Birch Planks", "Ground", "A still pond", 4, o_birch_planks, 0),
	new Item("Redwood Planks", "Ground", "A still pond", 5, o_redwood_planks, 0),
	new Item("Bricks", "Ground", "A still pond", 6, o_bricks, 0),
	new Item("Cobblestone", "Ground", "A still pond", 7, o_cobblestone, 0),
	new Item("Diamond Tile", "Ground", "A still pond", 8, o_diamond_tile, 0),
	new Item("Well", "Ground", "A still pond", 9, o_well, 0),
	new Item("Bush", "Ground", "A still pond", 10, o_bush, 0),
	new Item("Rose Bush", "Ground", "A still pond", 11, o_rose_bush, 0),
	new Item("Dark Door", "Ground", "A still pond", 12, o_ddoor, 0),
	new Item("Light Door", "Ground", "A still pond", 13, o_ldoor, 0),
	new Item("Tree", "Ground", "A still pond", 14, o_tree, 0),
	new Item("Television", "Ground", "A still pond", 15, o_television, 0),
	new Item("Bed", "Ground", "A still pond", 16, o_bed, 0),
	new Item("Dirt", "Ground", "A still pond", 17, o_dirt, 0),
	new Item("Beets", "Ground", "A still pond", 18, o_beets, 0),
]


global.ITEM_ARRAY = []
for(var i = 0; i < array_length(ITEMS); i++){
	var item = global.ITEMS[i];
	global.ITEM_ARRAY[item._id] = item;
}

global.GROUPS = [
	"Ground"
]


function Item(_name, _group, description, _internal_id, _object, _tile) constructor{
	name = _name;	
	desc = description;
	_id = _internal_id;
	object = _object;
	tile = _tile;
	group = _group;
}