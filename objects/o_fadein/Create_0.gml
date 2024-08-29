enum BOOTUP_STAGES {
	console,
	black,
	fadein,
	username
}

bottom = 0;
top = 0;
stage = BOOTUP_STAGES.console;
countdown = -1;
user = environment_get_variable("USERNAME");
cursor_pos = 0;
alph = 0;

console_log = [];

console_schedule = [
	["Viking BIOS 4.0 Release 2.8.24 - Copyright 1995-2024 GMC Software LLC", 20],
	["All Rights Reserved", 20],
	["Initiating bootup sequence...", 60],
	["", 10],
	["CPU: Detected", 10],
	["Memory Test OK", 10],
	["", 10],
	["Press <DEL> to enter SETUP...", 25],
	["", 10],
	["Running hardware test", 45],
	["CPU OK", 5],
	["GPU OK", 5],
	["RAM OK", 5],
	["Storage OK", 5],
	["Network OK", 5],
	["", 10],
	["Created by Mr. Magnus", 60 * 3],
	["", 10],
	
	["--------#@%*-:::::::::::::::::::::::::::::................................ .-%@@@@@#.     ", 1],
	[":------#@@@@*-::::::::::::::::::::::::::::::...............................=%@@#=%@@+      ", 1],
	[":::---+@@@@@@+-::::::::::::::::::::::::::::::.............................=@@@* .*@@#.    ", 1],
	[":::::-#@@%#@@%=::::::::::::::::::-==++++++++++++=-::.....................+@@%=.  +@@#:    ", 1],
	[":::::=%@@+:*@@#--::::::::::-=*%@@@@@@@@@@@@@@@@@@@@@%#*=-:.............=%@@+:    +@@%:    ", 1],
	[":::::+@@@-..*@@*---::::=+#%@@@@%%#*%@@@+--=+@@%**##%@@@@@@%#=:.......:#@@@=..    =@@%-    ", 1],
	[":::::+@@%-...=@@%+--+#%@@@@%#+-:::+@@@*...:#@@=-:-:---+*#%%@@@#=:..:*@@@#-....   *@@#:    ", 1],
	[":::::+@@@-... :#@@@@@@%##*+=-:::-=@@@*....*@@+----:::::::--=*%@@%##@@@*=.....   =@@@=..   ", 1],
	[":::::-%@@#:....:%@@@#+===++=----+@@@*:...-@@%------------:::::-*@@@@+:......   +@@@=..... ", 1],
	["::::::+@@@*:..:@@@%++**#%%%@@@@@@@@*.   .#@@@@@@@@@@@@@%%##*+=--%@@%......   :*@@#-.......", 1],
	[":::::::+@@@#-:*@@@@@@@@%%%%%#**%@@%-    -@@@#**********##%%@@@@@@@@@+:.    :*@@@#:........", 1],
	["::::::::=%@@@%@@@@%#***+*****++@@@*..  :#@@%++++++++++====++++**#%@@@@*+**#@@@%=..........", 1],
	["::::::::::=#@@@%**++**##%%%%%%%@@@=....=@@@@@@@@@@@@%%%#**++++====+#@@@@@@@#+-............", 1],
	["::::::::::::#@@##%%@@@@@@@@@@@@@@@=....+@@@@%%@@@@@@@@@@@@@@@@@%%#*++#@@@#:...............", 1],
	["::::::::::::+@@@@@%%@%#%@%%@%*+@@@*....+@@@**%#%@#%@%@%#***####%@@@@@@@@@%:...............", 1],
	["::::::::::::=@@@%+===::+@%%@+-+#@@@+::=%@@%==-:+@#%%=-**========*@@@##@@@@+:..............", 1],
	["::::::::::::=@@@@#==-=#%%%%#*==+#@@@%%@@@#-:=%%%@%@@%%%+-::----=*@@@#=-+#@@%+:............", 1],
	["::::::::::::=@@@@@*=-::::::::-==-=%@@@@#=::::::::::::::::::::::-=#@@@@#+--#@@%+:..........", 1],
	[".:::::::::::=@@@@@@+=-:::::::===-:-=++=:::::::::::::::::::::::::=*@@@@@@@#-+%@@%=:........", 1],
	["..::::::::::=@@#@@@#=-::::::-==-::::::::::::::::::::::::::::::::=+%@@@%%@@@#=*@@@#-.......", 1],
	[".....:::::::#@@+@@@#===:::::-==-::::::::::=+:::::::::::::::::::-==+%@@@#++%@@%*%@@%:......", 1],
	["......:::::+@@#=@@@#====-:::-++-::-----:::+@+:::::::::::-----:-==*#@@@@@@#=#@@@@@@@%:.....", 1],
	[".........:+@@@+*@@@+======-:-#@#######%%#*#@+::::::---=========+@@@@%*+*@@%+-=*@@@@@*:....", 1],
	["........:=@@@#=@@@@%@%+====-=+**+=======++**--::::-============+@@@@#+=--+@@%*::+%@@%=:...", 1],
	["........:*@@%+=@@@@@@@*==========++++++++++++===-============+*#@@@@@@%*=-=@@@@+::*@@%-...", 1],
	["........-%@@#+=+**#@@@*====++*%%@@@@@@@@@@@@@@@%%##**++=====+@@@@@%#%@@@%*=-*@@@%+:%@@#:..", 1],
	["........-@@@*++---#@@%++*#%@@@@@@%%#########%@@@@@@@@@@@%##*+%@@@#++==#@@@%=-=#@@@%%@@%:::", 1],
	["........:%@@%++===%@@@@@@@@%#*==-----------------=+**#%@@@@@@@@@@@%*+=-=#@@%*=-=#@@@@@%:::", 1],
	[".........=%@@%++++%@@@@%#+=**===++**##*++======++#%+::----=*%@@@@@@@#*+=-=%@@%+=-=#@@@%:::", 1],
	["..........:+@@@#*%@@%*=----####***++==+*##*******#@+:::::.   .=%@@@@@@@%#+=#%@@#+=*@@@=:::", 1],
	["............:*@@@@@@*-----------#@##**#%@*--::::::-:::::::.    .@@@##@@@@@*:-*@@%%@@%=::::", 1],
	["..............=@@@@%+------------*#####*+--:::::::::::::::.     %@@%:-+#@@@=-:+@@@@#-:::::", 1],
	["...............-%@@%+-------------+++++++-::::::::::::::::.     %@@@=-::=@@#+=-%@@@-::::::", 1],
	["...............=@@@#+-------------+++++++-:::::::::::::.       .@@@@*+-:-*@@#+=#@%+:::::::", 1],
	["...............*@@@++-------------+++++++=:::::::::::::.       =@@@@@*++--%@@%*#@#-:::::::", 1],
	["..............=@@@#++=-----------=+++++++=:::::::::::::.       -@@@@@@#++==%@@@@@%=:::::::", 1],
	["  ...........-@@%*+++=-------------==++++-::::::::.   ..       .@@@#%@@@#*=-=#@@@@%:::::::", 1],
	["    ........=@@#++++++++=====------:-----:::::::::              *@@%-=*%@@@%##%@@@@=::::::", 1],
	["       .....#@@+++++++++++++++-----::::::::::::::               -@@@-:---+*####%@@%=::::::", 1],
	["         ...*@@%@%++++++++++++=--===-:::::::::::.               :@@@+:::-----------:::::::", 1],
	["          ..+@@@@@*++++++++++++==+====-===-::::.                .%@@+:::::----------::::::", 1],
	["            .+%@@@#++*%@@@#*++++++***++++#%%#*=.         .=**=:..#@@#::::::-----------::::", 1],
	["              .=%@@@@@@@@@@@%**##@@@@%#%@@@@@@@@@%*=.   -%@@@@@@#@@@#::::::::-----------::", 1],
	["               .:*%@@@*-.=@@@@@@@@%%@@@@@%+:-=*##@@@@*+%@@@=-+#%@@@@*::::::::::----------:", 1],
	["                 ..::.....=**+=--:.:=+=-:........:-+*%%%#=:::::::---:::::::::::::---------", 1],
	["", 60],
	[working_directory + "> run prikkles.bootup", 30],
	[working_directory + "> mount P", 5],
	[working_directory + "> cd P:", 5],
	["P: > cd pikkles", 5],
	["P:pikkles/ > ECHO configuration.xml", 5],
	["P: > simnet connect $MAINFRAME_URL", 5],
	["Connecting to mainframe", 30],
	["Mainframe connected", 5],
	["P: > run prikkles.sim", 30],
	["", 5],
	["**************************", 5],
	["	    PRIKKLE PLOTS", 5],
	[" A COMMUNITY SIMULATION BY Mr. MAGNUS    ", 5],
	["**************************", 15],
	["loading...", 300],
]

alarm[0] = 60;