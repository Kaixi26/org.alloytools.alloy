open main
pred idgqKtXfWPGTd3rqm34_prop5 {
	

    all t:Train |{
     	always (t.pos in Exit implies  no t.pos')
      	
    }
  	
}
pred __repair { idgqKtXfWPGTd3rqm34_prop5 }
check __repair { idgqKtXfWPGTd3rqm34_prop5 <=> prop5o }