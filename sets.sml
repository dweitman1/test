fun len(nil) = 0
| len(x::xs) = 1 + len(xs)i

fun cardinality(([], []): (int list * bool list)) = 0
| cardinality((x, b): (int list * bool list)) = if hd b then 1 + cardinality(tl x, tl b) else cardinality(tl x, tl b)

fun elementOf(e: int, ([], []): (int list * bool list)) = false
| elementOf(e: int, (x, b): (int list * bool list)) = if e = hd x andalso hd b then true else elementOf(e, (tl x, tl b))

fun subset(([], []): (int list * bool list), (_, _): (int list * bool list)) = true
| subset((x1, b1): (int list * bool list), (x2, b2): (int list * bool list)) = if hd b1 then elementOf(hd x1,(x2, b2)) else subset((tl x1, tl b1), (x2, b2))

fun equals((x1, b1): (int list * bool list), (x2, b2): (int list * bool list)) = if subset((x1, b1), (x2, b2)) andalso subset((x2, b2), (x1, b1)) then true else false

fun union(([], []): (int list * bool list), (x, b): (int list * bool list)) = (x, b)
| union((x, b): (int list * bool list), ([], []): (int list * bool list)) = (x, b)
| union((x1, b1): (int list * bool list), (x2, b2): (int list * bool list)) = if not(elementOf(hd x2, (x1, b1))) andalso hd b2 then union((x1@[hd x2], b1@[true]), (tl x2, tl b2)) else union((x1, b1), (tl x2, tl b2))


fun intersection(([], []): (int list * bool list), (x, b): (int list * bool list)) = ([], [])
| intersection((x, b): (int list * bool list), ([], []): (int list * bool list)) = ([], [])
| intersection((x1, b1): (int list * bool list), (x2, b2): (int list * bool list)) = if elementOf(hd x1, (x2, b2)) andalso hd b1 then ([hd x1], [hd b1])::intersection((tl x1, tl b1), (x2, b2)) else intersection((tl x1, tl b1), (x2, b2))




