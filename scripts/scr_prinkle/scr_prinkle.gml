function Prinkle() constructor{
	name = "";
	_id = 0;
	color_1 = c_white;
	color_2 = c_black;
	pattern = 0;
	
	static generate = function(iid = undefined){
		_id = is_undefined(iid) ? irandom(0xFFFFFFFF) : iid;
		name = random_name(_id);
		color_1 = _id >> 8 & #FFFFFF;
		color_2 = (~_id) >> 8 & #FFFFFF;
		pattern = 0;
	}
}
