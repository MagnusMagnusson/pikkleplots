delete_count++;
if(delete_count == 3){
	array_push(console_log, "*********");
	array_push(console_log, "DELETING SAVE FILES");
	
	var f = file_find_first("*.prinkle", fa_none);
	while(f != ""){
		file_delete(f);
		array_push(console_log, "DELETED: " + f);
		f = file_find_next();
	}
	file_find_close();
	array_push(console_log, "DELETED");
	array_push(console_log, "*********");
} else {
	array_push(console_log, "*********");
	array_push(console_log, "Settings: ACCESS DENIED.");
	array_push(console_log, "BIOS access restricted by administrator");
	array_push(console_log, "*********");
}