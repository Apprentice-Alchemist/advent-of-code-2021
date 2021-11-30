import days.*;

function main() {
	Sys.println("Advent of Code 2021");
	final days:Array<() -> Void> = getDays();
	final args = Sys.args();
	if (args[0] == "--day") {
		final day = Std.parseInt(args[1]);
		if (days[day] != null) {
			Sys.println('Running day $day:');
			days[day]();
		} else {
			Sys.println('No such day : $day');
		}
	} else {
		for (i => day in days) {
			Sys.println('Running day $day:');
			day();
		}
	}
}

macro function getDays() {
	final exprs:Array<haxe.macro.Expr> = [];
	final reg = ~/(Day(\d+)).hx/g;
	for (day in sys.FileSystem.readDirectory("src/days")) {
		if (reg.match(day)) {
			final mod = reg.matched(1);
			final index = Std.parseInt(reg.matched(2));
			exprs.push(macro {
				$i{mod}.run;
			});
		}
	}
	return macro $a{exprs};
}
