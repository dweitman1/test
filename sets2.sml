fun cardinality(xs:int list, bs:bool list) = 
	foldl 	( fn(true, x) => 1 + x | (false, x) => x )
		0
		bs

fun elementOf(e:int, (xs:int list, bs:bool list)) = 
	#1( foldl 
		( fn(x, (y, true::tl)) => (e=x orelse y, tl)
		| (x, (y, false::tl)) => (y, tl)
		| (x, (y, [])) => (y, []) 
		)	
		(false, bs)
		xs	
	)

fun subset((xs1:int list, bs1:bool list), (xs2:int list, bs2:bool list)) = 
	#1( foldl
		( fn(x, (y, true::tl)) => (elementOf(x, (xs2, bs2)) andalso y, tl)
		| (x, (y, false::tl)) => (y, tl)
		| (x, (y, [])) => (y, [])
		)
		(true, bs1)
		xs1
	)

fun equals((xs1:int list, bs1:bool list), (xs2:int list, bs2:bool list)) = 
	if subset((xs1, bs1), (xs2, bs2)) andalso subset((xs2, bs2), (xs1, bs1)) then true else false
(*
fun union((xs1: int list, bs1:bool list), (xs2:int list, bs2:bool list)) = 
	#2( foldl
		( fn(x, true::tl, (xs, bs)) => if elementOf(x, (xs, bs)) then (tl, (xs, bs)) else (tl, (xs@[x], bs@[true])) 
		| (x, false::tl, (xs, bs)) => (tl, (xs, bs))
		| (x, [], (xs, bs)) => ([], (xs, bs))
		)
		(bs2, (xs1, bs1))
		xs2
	)

*)
