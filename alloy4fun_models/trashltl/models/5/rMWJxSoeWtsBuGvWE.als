open main
pred idrMWJxSoeWtsBuGvWE_prop6 {
	all f : File | f in Trash implies always f in Trash
}
pred __repair { idrMWJxSoeWtsBuGvWE_prop6 }
check __repair { idrMWJxSoeWtsBuGvWE_prop6 <=> prop6o }
