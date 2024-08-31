draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, ourWorld.prinkle.color_1, 1);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, 1);

if(image_xscale >= targetScale){
	draw_set_font(fnt_main_menu);	
	var texts = [
		"You've adopted a Prinkle!",
		string("This is ${0}$!", ourWorld.prinkle.name),
		string("${0}$ is your Prinkle. Prinkles may be digital, but they want care as much as you and me!", ourWorld.prinkle.name),
		string("${0}$ needs a good home", ourWorld.prinkle.name),
		string("Please take care of ${0}!", ourWorld.prinkle.name),
		"",
		string("press <Return>")
	];
	
	for(var i = 0; i < array_length(texts); i++){
		var text = texts[i];
		scr_text_highlight(x - string_width(text)/2, y + string_height("A")*i + sprite_height / 2, text, c_white, c_yellow);
	}
}