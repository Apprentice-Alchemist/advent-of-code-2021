function inputString(name:String):String {
	return sys.io.File.getContent('input/$name.txt');
}

function inputBytes(name:String):haxe.io.Bytes {
	return sys.io.File.getBytes('input/$name.txt');
}

function assert(b:Bool) {}
