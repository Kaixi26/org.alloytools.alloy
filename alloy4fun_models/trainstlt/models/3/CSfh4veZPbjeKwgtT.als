open main
pred idCSfh4veZPbjeKwgtT_prop4 {
	
  all t1, t2 : Train | always t1.pos != t2.pos
}
pred __repair { idCSfh4veZPbjeKwgtT_prop4 }
check __repair { idCSfh4veZPbjeKwgtT_prop4 <=> prop4o }