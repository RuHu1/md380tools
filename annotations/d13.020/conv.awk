BEGIN {
    init = 1 ;
}

$0 ~ /MARKER/ {
    init = 0 ;
    next ;
}

init == 1 {
    a = strtonum("0x"$1);
    sym[a] = $2 ;
#print "hit" OFS $1 OFS a OFS $2
    next ;
}

$1 == "af+" { 
#print $2
    a = strtonum($2);
    if( a in sym ) {
        $4 = sym[a];
#print "hit" OFS $4 OFS a       
    }
    print $0 ;
    next ;
}

$1 == "f" {  
    print $0 ;
    next ;
#    a = cnv($4);
#    if( a in addr ) {
#        next ;
#    }
#    addr[a] = $2 ;
}

{
    print $0 ;
}
