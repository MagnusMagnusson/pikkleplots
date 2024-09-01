var iid = 0;
global.ITEMS = [
	new Item("Grass", "Ground", "A soft patch of grass, with no other items on top", 0, undefined, 0),
	new Item("River", "Ground", "A gentle stream", 1, o_river, 0),
	new Item("Lake", "Ground", "A still pond", 2, o_lake, 0),
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