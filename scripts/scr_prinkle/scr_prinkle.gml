function Prinkle() constructor{
	name = "";
	_id = 0;
	color_1 = c_white;
	color_2 = c_black;
	pattern = 0;
	
	generate(){
		name = random_name();
		_id = irandom(0xFFFFFFFF);
		color_1 = irandom(c_white);
		color_2 = irandom(c_white);
		pattern = 0;
	}
}

function random_name(){
	return "Penelope"; //Chosen by a fair dice roll. Guaranteed to be random. 
}