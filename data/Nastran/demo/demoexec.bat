$APICLIENTDIR/nststrel $NASTPROC $DEMODIR/d10134 out=$OUTDIR/l10134 scr=no dbs=$DBSDIR/l10134 bat=no not=no sys316=3 
$APICLIENTDIR/nststrel $NASTPROC $DEMODIR/hd15302 out=$OUTDIR/ld15302 scr=no dbs=$DBSDIR/ld15302 bat=no not=no sys316=3 IFPSTAR=YES 
$APICLIENTDIR/nststrel $NASTPROC $DEMODIR/hd15302 out=$OUTDIR/ld15302-ci scr=no dbs=$DBSDIR/ld15302-ci bat=no not=no post="$PROCSDIR/tkmv.sh ld15302" sys316=3 IFPSTAR=NO 
$APICLIENTDIR/nststrel $NASTPROC $DEMODIR/v10111 out=$OUTDIR/l10111 scr=no dbs=$DBSDIR/l10111 bat=no not=no sys316=3  IFPSTAR=NO 
$APICLIENTDIR/nststrel $NASTPROC $DEMODIR/v10102 out=$OUTDIR/lv10102 scr=no dbs=$DBSDIR/lv10102 bat=no not=no sys316=3 IFPSTAR=YES 
$APICLIENTDIR/nststrel $NASTPROC $DEMODIR/v10102 out=$OUTDIR/lv10102-ci scr=no dbs=$DBSDIR/lv10102-ci bat=no not=no post="$PROCSDIR/tkmv.sh lv10102" sys316=3 IFPSTAR=NO 
$APICLIENTDIR/nsbrowsr $NASTPROC $DEMODIR/eli71.dat out=$OUTDIR/nstgpf scr=mini dbs=$DBSDIR/ bat=no IFPSTAR=NO sys316=3 INP=$TPLDIR/api_ns/nstgpft.dat 
$NASTPROC $DEMODIR/eli2007 out=$OUTDIR/eli2007 scr=yes bat=no not=no post=$PROCSDIR/dbc.sh eli2007 IFPSTAR=NO 
$NASTPROC $DEMODIR/v10903a out=$OUTDIR/v10903a scr=no dbs=$DBSDIR/v10903a bat=no not=no 
$NASTPROC $DEMODIR/v10903ar out=$OUTDIR/v10903ar scr=no dbs=$DBSDIR/v10903a bat=no not=no 
$NASTPROC $DEMODIR/v10903b out=$OUTDIR/v10903b scr=no dbs=$DBSDIR/v10903b bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/v10903br out=$OUTDIR/v10903br scr=no dbs=$DBSDIR/v10903b bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/v10903b out=$OUTDIR/v10903b-ci scr=no dbs=$DBSDIR/v10903b-ci bat=no not=no ifpstar=no 
$NASTPROC $DEMODIR/v10903br-ci out=$OUTDIR/v10903br-ci scr=no dbs=$DBSDIR/v10903b-ci bat=no not=no ifpstar=no 
$NASTPROC $DEMODIR/v10903c out=$OUTDIR/v10903c scr=no dbs=$DBSDIR/v10903c bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/v10903cr out=$OUTDIR/v10903cr scr=no dbs=$DBSDIR/v10903c bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/v10903c out=$OUTDIR/v10903c-ci scr=no dbs=$DBSDIR/v10903c-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10903cr-ci out=$OUTDIR/v10903cr-ci scr=no dbs=$DBSDIR/v10903c-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10903d out=$OUTDIR/v10903d scr=no dbs=$DBSDIR/v10903d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/v10903dr out=$OUTDIR/v10903dr scr=no dbs=$DBSDIR/v10903d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/v10903d out=$OUTDIR/v10903d-ci scr=no dbs=$DBSDIR/v10903d bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10903dr-ci out=$OUTDIR/v10903dr-ci scr=no dbs=$DBSDIR/v10903d bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d0307 out=$OUTDIR/d0307 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d07d2 out=$OUTDIR/d07d2 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10101d out=$OUTDIR/d10101d scr=no dbs=$DBSDIR/d10101d bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d10102r out=$OUTDIR/d10102r scr=no dbs=$DBSDIR/d10101d bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d10134 out=$OUTDIR/d10134 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10138d out=$OUTDIR/d10138d scr=no dbs=$DBSDIR/d10138d bat=no not=no 
$NASTPROC $DEMODIR/d10139r out=$OUTDIR/d10139r scr=no dbs=$DBSDIR/d10138d bat=no not=no 
$NASTPROC $DEMODIR/d10140r out=$OUTDIR/d10140r scr=no dbs=$DBSDIR/d10138d bat=no not=no 
$NASTPROC $DEMODIR/d10139 out=$OUTDIR/d10139 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10140 out=$OUTDIR/d10140 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10160 out=$OUTDIR/d10160 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10306d out=$OUTDIR/d10306d scr=no dbs=$DBSDIR/d10306d bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/d11207r out=$OUTDIR/d11207r scr=no dbs=$DBSDIR/d10306d bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/d10370d out=$OUTDIR/d10370d scr=no dbs=$DBSDIR/d10370d bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/d10371r out=$OUTDIR/d10371r scr=no dbs=$DBSDIR/d10370d bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/d10372r out=$OUTDIR/d10372r scr=no dbs=$DBSDIR/d10370d bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/d10370d out=$OUTDIR/d10370d-ci scr=no dbs=$DBSDIR/d10370d bat=no not=no ifpstar=no 
$NASTPROC $DEMODIR/d10371r-ci out=$OUTDIR/d10371r-ci scr=no dbs=$DBSDIR/d10370d bat=no not=no ifpstar=no 
$NASTPROC $DEMODIR/d10372r-ci out=$OUTDIR/d10372r-ci scr=no dbs=$DBSDIR/d10370d bat=no not=no ifpstar=no 
$NASTPROC $DEMODIR/d10307 out=$OUTDIR/d10307 scr=no dbs=$DBSDIR/d10307 bat=no not=no 
$NASTPROC $DEMODIR/d10307r out=$OUTDIR/d10307r scr=no dbs=$DBSDIR/d10307 bat=no not=no 
$NASTPROC $DEMODIR/d10504 out=$OUTDIR/d10504 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10701 out=$OUTDIR/d10701 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10702 out=$OUTDIR/d10702 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10703 out=$OUTDIR/d10703 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d11401s out=$OUTDIR/d11401s scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d11402s out=$OUTDIR/d11402s scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/hd10101 out=$OUTDIR/hd10101 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/hd15301 out=$OUTDIR/hd15301 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/hd15302 out=$OUTDIR/hd15302 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/hd15303 out=$OUTDIR/hd15303 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/hd15304 out=$OUTDIR/hd15304 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/hd15305 out=$OUTDIR/hd15305 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/hd15306 out=$OUTDIR/hd15306 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/hd15901 out=$OUTDIR/hd15901 scr=no dbs=$DBSDIR/hd15901 bat=no not=no post="$PROCSDIR/psplot.sh hd15901" 
$NASTPROC $DEMODIR/hd15902 out=$OUTDIR/hd15902 scr=no dbs=$DBSDIR/hd15901 bat=no not=no 
$NASTPROC $DEMODIR/hd15903 out=$OUTDIR/hd15903 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10111d out=$OUTDIR/d10111d scr=no dbs=$DBSDIR/d10111d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/d10112r out=$OUTDIR/d10112r scr=no dbs=$DBSDIR/d10111d bat=no not=no post="$PROCSDIR/psplot.sh d10112r" IFPSTAR=YES 
$NASTPROC $DEMODIR/d10113r out=$OUTDIR/d10113r scr=no dbs=$DBSDIR/d10111d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/d10311r out=$OUTDIR/d10311r scr=no dbs=$DBSDIR/d10111d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/d10811r out=$OUTDIR/d10811r scr=no dbs=$DBSDIR/d10111d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/d10911r out=$OUTDIR/d10911r scr=no dbs=$DBSDIR/d10111d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/d11111r out=$OUTDIR/d11111r scr=no dbs=$DBSDIR/d10111d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/d11211r out=$OUTDIR/d11211r scr=no dbs=$DBSDIR/d10111d bat=no not=no IFPSTAR=YES 
$NASTPROC $DEMODIR/d10111d-ci out=$OUTDIR/d10111d-ci scr=no dbs=$DBSDIR/d10111d-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d10112r-ci out=$OUTDIR/d10112r-ci scr=no dbs=$DBSDIR/d10111d-ci bat=no not=no post="$PROCSDIR/psplot.sh d10112r-ci" IFPSTAR=NO 
$NASTPROC $DEMODIR/d10113r-ci out=$OUTDIR/d10113r-ci scr=no dbs=$DBSDIR/d10111d-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d10311r-ci out=$OUTDIR/d10311r-ci scr=no dbs=$DBSDIR/d10111d-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d10811r-ci out=$OUTDIR/d10811r-ci scr=no dbs=$DBSDIR/d10111d-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d10911r-ci out=$OUTDIR/d10911r-ci scr=no dbs=$DBSDIR/d10111d-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d11111r-ci out=$OUTDIR/d11111r-ci scr=no dbs=$DBSDIR/d10111d-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d11211r-ci out=$OUTDIR/d11211r-ci scr=no dbs=$DBSDIR/d10111d-ci bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/d10114s out=$OUTDIR/d10114s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10312d out=$OUTDIR/d10312d scr=no dbs=$DBSDIR/d10312d bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/d10312r out=$OUTDIR/d10312r scr=no dbs=$DBSDIR/d10312d bat=no not=no ifpstar=yes 
$NASTPROC $DEMODIR/d10312d out=$OUTDIR/d10312d-ci scr=no dbs=$DBSDIR/d10312d bat=no not=no ifpstar=no 
$NASTPROC $DEMODIR/d10312r-ci out=$OUTDIR/d10312r-ci scr=no dbs=$DBSDIR/d10312d bat=no not=no ifpstar=no 
$NASTPROC $DEMODIR/d10360s out=$OUTDIR/d10360s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/d10712s out=$OUTDIR/d10712s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/prob1 out=$OUTDIR/prob1 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/prob2 out=$OUTDIR/prob2 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/prob3 out=$OUTDIR/prob3 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/prob4 out=$OUTDIR/prob4 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/prob5 out=$OUTDIR/prob5 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/prob7 out=$OUTDIR/prob7 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/um24 out=$OUTDIR/um24 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/um530 out=$OUTDIR/um530 scr=no dbs=$DBSDIR/um530 bat=no not=no 
$NASTPROC $DEMODIR/um531 out=$OUTDIR/um531 scr=no dbs=$DBSDIR/um530 bat=no not=no 
$NASTPROC $DEMODIR/um5311 out=$OUTDIR/um5311 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/um533 out=$OUTDIR/um533 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/um539 out=$OUTDIR/um539 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/um54 out=$OUTDIR/um54 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v03lan out=$OUTDIR/v03lan scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v0502a out=$OUTDIR/v0502a scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10101 out=$OUTDIR/v10101 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10102 out=$OUTDIR/v10102 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10103 out=$OUTDIR/v10103 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10104 out=$OUTDIR/v10104 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10105d out=$OUTDIR/v10105d scr=no dbs=$DBSDIR/v10105d bat=no not=no 
$NASTPROC $DEMODIR/v10305r out=$OUTDIR/v10305r scr=no dbs=$DBSDIR/v10105d bat=no not=no 
$NASTPROC $DEMODIR/v10106 out=$OUTDIR/v10106 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10107 out=$OUTDIR/v10107 scr=yes bat=no not=no post="$PROCSDIR/pchmv.sh v10107" 
$NASTPROC $DEMODIR/v10108 out=$OUTDIR/v10108 scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10109 out=$OUTDIR/v10109 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10110 out=$OUTDIR/v10110 scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10111 out=$OUTDIR/v10111 scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10112 out=$OUTDIR/v10112 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10112s out=$OUTDIR/v10112s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10113s out=$OUTDIR/v10113s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10301 out=$OUTDIR/v10301 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10302 out=$OUTDIR/v10302 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10303 out=$OUTDIR/v10303 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10307 out=$OUTDIR/v10307 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10308s out=$OUTDIR/v10308s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10309s out=$OUTDIR/v10309s scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10310s out=$OUTDIR/v10310s scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10311d out=$OUTDIR/v10311d scr=no dbs=$DBSDIR/v10311d bat=no not=no 
$NASTPROC $DEMODIR/v10311r out=$OUTDIR/v10311r scr=no dbs=$DBSDIR/v10311d bat=no not=no 
$NASTPROC $DEMODIR/v103gdr out=$OUTDIR/v103gdr scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v103guy out=$OUTDIR/v103guy scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v103inv out=$OUTDIR/v103inv scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v103lan out=$OUTDIR/v103lan scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10501 out=$OUTDIR/v10501 scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v10601s out=$OUTDIR/v10601s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10603s out=$OUTDIR/v10603s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10701 out=$OUTDIR/v10701 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10702 out=$OUTDIR/v10702 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10801 out=$OUTDIR/v10801 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10901 out=$OUTDIR/v10901 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10902 out=$OUTDIR/v10902 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10903 out=$OUTDIR/v10903 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v10904 out=$OUTDIR/v10904 scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v11001 out=$OUTDIR/v11001 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v11101 out=$OUTDIR/v11101 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v11201 out=$OUTDIR/v11201 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v11401 out=$OUTDIR/v11401 scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v11501 out=$OUTDIR/v11501 scr=yes bat=no not=no IFPSTAR=NO 
$NASTPROC $DEMODIR/v12901 out=$OUTDIR/v12901 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v12902 out=$OUTDIR/v12902 scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v14501q out=$OUTDIR/v14501q scr=yes bat=no not=no post="$PROCSDIR/psplot.sh v14501q" 
$NASTPROC $DEMODIR/v15301s out=$OUTDIR/v15301s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v15901s out=$OUTDIR/v15901s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v15902s out=$OUTDIR/v15902s scr=yes bat=no not=no 
$NASTPROC $DEMODIR/v2408a out=$OUTDIR/v2408a scr=yes bat=no not=no IFPSTAR=NO 
