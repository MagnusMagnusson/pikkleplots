image_index++;
if(image_index % image_number == 0){
	instance_create_layer(x,y - 100,layer, o_big_prinkle);
	instance_destroy();
}

x += choose(50,-50);