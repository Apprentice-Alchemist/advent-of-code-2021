package days;

function run() {
	assert(countGreaters(inputString("test1a")) == 7);
	final input = inputString("day1");
	final gCount = countGreaters(input);
	Sys.println('$gCount measurements are greater than the previous one.');
}

private function countGreaters(input:String) {
	final input:Array<Int> = input.split("\n").map(s -> cast Std.parseInt(s));
	var greaterCount = 0;
	for (index => value in input)
		if (index - 1 >= 0 && value > input[index - 1]) {
			greaterCount++;
		}
	return greaterCount;
}
