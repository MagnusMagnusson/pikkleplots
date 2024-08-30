function Prinkle() constructor{
	name = "";
	_id = 0;
	color_1 = c_white;
	color_2 = c_black;
	pattern = 0;
	
	static generate = function(){
		_id = irandom(0xFFFFFFFF);
		name = random_name(_id);
		color_1 = irandom(_id >> 8 & #FFFFFF);
		color_2 = irandom((~_id) >> 8 & #FFFFFF);
		pattern = 0;
	}
}
