# Automated Analytics - Registered Version 8.3.0.b334 - Copyright 2015 SAP SE or an SAP affiliate company. All rights reserved. - Model built in 8.3.0.b334 - Model Name is sensVal_DataSet - Model Version is 1 
function fabs( a ) {
	CONVFMT = "%.17g"
	if( a > 0 ) return a;
	else return -a;
}

function doublecmp( a, b ) {
	CONVFMT = "%.17g"
	if ( a == b ) return 0;
	else return 1;
}

function doublesegcmp( iX, iXStart, iEqualStart, iXEnd, iEqualEnd ) {
	CONVFMT = "%.17g"
	if (iX < iXStart) return -2;
	if (iX == iXStart) {
		if (iEqualStart) return 0;
		else return -1;
	}
	else {
		if (iX < iXEnd) return 0;
		if (iX == iXEnd) {
			if (iEqualEnd) return 0;
			else return 1;
		}
		else {
			return 2;
		}
	}
}

function Kxen_RobustRegression_0_KxVar3(iValue) {
	gsub( "(^[ \t\"']*)|([ \t\"']*$)", "", iValue);
	CONVFMT = "%.17g"
	lValue = iValue;
	if( iValue == "" || (iValue  !~  /^[\+\-]?[0-9]*\.?[0-9]*\e?[\+\-]?[0-9]*\.?[0-9]*$/) ) {
		return -0.067299416228293316;
	}
	lValue = lValue+0.0;
	if ( lValue > 34 ) {
		lValue = 34;
	}
	else if ( lValue < 0 ) {
		lValue = 0;
	}
	if( 0 == doublesegcmp( lValue, 0.0, 1, 0.0, 1) ) { 
		return 0.23839258039037031;
	}
	if( 0 == doublesegcmp( lValue, 0.0, 0, 11.0, 1) ) { 
		return (0.0041799302539411391 * lValue + 0.23839258039538125);
	}
	if( 0 == doublesegcmp( lValue, 12.0, 1, 12.0, 1) ) { 
		return 0.22486331595665135;
	}
	if( 0 == doublesegcmp( lValue, 12.0, 0, 13.0, 1) ) { 
		return (0.025005874566915054 * lValue + -0.04653145551676996);
	}
	if( 0 == doublesegcmp( lValue, 14.0, 1, 14.0, 1) ) { 
		return 0.35394443145556265;
	}
	if( 0 == doublesegcmp( lValue, 15.0, 1, 16.0, 1) ) { 
		return (0.020436152641238381 * lValue + 0.11922893300301585);
	}
	if( 0 == doublesegcmp( lValue, 17.0, 1, 18.0, 0) ) { 
		return (-0.030957704250247575 * lValue + 0.96372054673612162);
	}
	if( 0 == doublesegcmp( lValue, 18.0, 1, 19.0, 1) ) { 
		return (-0.02337216032736289 * lValue + 0.82718075612176989);
	}
	if( 0 == doublesegcmp( lValue, 20.0, 1, 34.0, 1) ) { 
		return (0.0041799302539411443 * lValue + 0.35879521624670713);
	}
	if( lValue > 34.0 ) { 
		return (0.0041799302539411443 * lValue + 0.35879521624670713);
	}
	return 0.43743957448258119;
}

function Kxen_RobustRegression_0_KxVar6(iValue) {
	gsub( "(^[ \t\"']*)|([ \t\"']*$)", "", iValue);
	CONVFMT = "%.17g"
	lValue = iValue;
	if( iValue == "" || (iValue  !~  /^[\+\-]?[0-9]*\.?[0-9]*\e?[\+\-]?[0-9]*\.?[0-9]*$/) ) {
		return -0.070832543024713965;
	}
	lValue = lValue+0.0;
	if ( lValue > 50 ) {
		lValue = 50;
	}
	else if ( lValue < 0 ) {
		lValue = 0;
	}
	if( 0 == doublesegcmp( lValue, 0.0, 1, 0.0, 1) ) { 
		return 0.21244601335180163;
	}
	if( 0 == doublesegcmp( lValue, 1.0, 1, 1.0, 1) ) { 
		return 0.033789788236704449;
	}
	if( 0 == doublesegcmp( lValue, 2.0, 1, 2.0, 1) ) { 
		return 0.22231121402679854;
	}
	if( 0 == doublesegcmp( lValue, 3.0, 1, 3.0, 1) ) { 
		return 0.22724381436429703;
	}
	if( 0 == doublesegcmp( lValue, 4.0, 1, 4.0, 1) ) { 
		return 0.23217641470179551;
	}
	if( 0 == doublesegcmp( lValue, 5.0, 1, 5.0, 1) ) { 
		return 0.23710901503929396;
	}
	if( 0 == doublesegcmp( lValue, 6.0, 1, 6.0, 1) ) { 
		return 0.24204161537679242;
	}
	if( 0 == doublesegcmp( lValue, 7.0, 1, 7.0, 1) ) { 
		return 0.2469742157142909;
	}
	if( 0 == doublesegcmp( lValue, 8.0, 1, 8.0, 1) ) { 
		return 0.25190681605178938;
	}
	if( 0 == doublesegcmp( lValue, 9.0, 1, 9.0, 1) ) { 
		return 0.25683941638928787;
	}
	if( 0 == doublesegcmp( lValue, 10.0, 1, 10.0, 1) ) { 
		return 0.26177201672678629;
	}
	if( 0 == doublesegcmp( lValue, 11.0, 1, 11.0, 1) ) { 
		return 0.26670461706428478;
	}
	if( 0 == doublesegcmp( lValue, 12.0, 1, 12.0, 1) ) { 
		return 0.27163721740178326;
	}
	if( 0 == doublesegcmp( lValue, 13.0, 1, 13.0, 1) ) { 
		return 0.27656981773928169;
	}
	if( 0 == doublesegcmp( lValue, 14.0, 1, 14.0, 1) ) { 
		return 0.28150241807678017;
	}
	if( 0 == doublesegcmp( lValue, 15.0, 1, 15.0, 1) ) { 
		return 0.28643501841427865;
	}
	if( 0 == doublesegcmp( lValue, 16.0, 1, 16.0, 1) ) { 
		return 0.29136761875177714;
	}
	if( 0 == doublesegcmp( lValue, 17.0, 1, 17.0, 1) ) { 
		return 0.29630021908927562;
	}
	if( 0 == doublesegcmp( lValue, 18.0, 1, 18.0, 1) ) { 
		return 0.30123281942677405;
	}
	if( 0 == doublesegcmp( lValue, 19.0, 1, 19.0, 1) ) { 
		return 0.30616541976427253;
	}
	if( 0 == doublesegcmp( lValue, 20.0, 1, 20.0, 1) ) { 
		return 0.31109802010177101;
	}
	if( 0 == doublesegcmp( lValue, 21.0, 1, 21.0, 1) ) { 
		return 0.31603062043926944;
	}
	if( 0 == doublesegcmp( lValue, 22.0, 1, 22.0, 1) ) { 
		return 0.32096322077676792;
	}
	if( 0 == doublesegcmp( lValue, 23.0, 1, 23.0, 1) ) { 
		return 0.3258958211142664;
	}
	if( 0 == doublesegcmp( lValue, 24.0, 1, 24.0, 1) ) { 
		return 0.33082842145176489;
	}
	if( 0 == doublesegcmp( lValue, 25.0, 1, 25.0, 1) ) { 
		return 0.33576102178926337;
	}
	if( 0 == doublesegcmp( lValue, 26.0, 1, 26.0, 1) ) { 
		return 0.3406936221267618;
	}
	if( 0 == doublesegcmp( lValue, 27.0, 1, 27.0, 1) ) { 
		return 0.34562622246426028;
	}
	if( 0 == doublesegcmp( lValue, 28.0, 1, 28.0, 1) ) { 
		return 0.35055882280175876;
	}
	if( 0 == doublesegcmp( lValue, 29.0, 1, 29.0, 1) ) { 
		return 0.35549142313925725;
	}
	if( 0 == doublesegcmp( lValue, 30.0, 1, 30.0, 1) ) { 
		return 0.36042402347675567;
	}
	if( 0 == doublesegcmp( lValue, 31.0, 1, 31.0, 1) ) { 
		return 0.36535662381425416;
	}
	if( 0 == doublesegcmp( lValue, 32.0, 1, 32.0, 1) ) { 
		return 0.37028922415175264;
	}
	if( 0 == doublesegcmp( lValue, 32.0, 0, 48.0, 1) ) { 
		return 0.37522182448925112;
	}
	if( 0 == doublesegcmp( lValue, 48.0, 0, 50.0, 1) ) { 
		return 0.38015442482674955;
	}
	if( lValue > 50.0 ) { 
		return 0.38015442482674955;
	}
	return 0.033789788236704449;
}

function Kxen_RobustRegression_0_KxVar9(iValue) {
	gsub( "(^[ \t\"']*)|([ \t\"']*$)", "", iValue);
	if( iValue == ""  ) {
		return 0.41089397381763682;
	}
	if ( "1018" ~ iValue ) {
		return -0.088358685417961172;
	}
	else if ( "1017" ~ iValue ) {
		return -0.056551883695275529;
	}
	else if ( "1012" ~ iValue ) {
		return -0.088358685417961172;
	}
	else if ( "1011" ~ iValue ) {
		return -0.11919982206458372;
	}
	else if ( "1027" ~ iValue ) {
		return -0.177484561523236;
	}
	else if ( "1020" ~ iValue ) {
		return -0.056551883695275529;
	}
	else if ( "1019" ~ iValue ) {
		return 0.033158856287568268;
	}
	else if ( "1008" ~ iValue ) {
		return -0.177484561523236;
	}
	else if ( "1015" ~ iValue ) {
		return 0.033158856287568268;
	}
	else if ( "1016" ~ iValue ) {
		return 0.065400463568564215;
	}
	else if ( "1013" ~ iValue ) {
		return 0.098520894416126548;
	}
	else if ( "1014" ~ iValue ) {
		return 0.065400463568564215;
	}
	else if ( "1024" ~ iValue ) {
		return -0.11919982206458372;
	}
	else if ( "1026" ~ iValue ) {
		return -0.15209722374351825;
	}
	else if ( "1023" ~ iValue ) {
		return -0.056551883695275529;
	}
	else if ( "1021" ~ iValue ) {
		return 0.033158856287568268;
	}
	else if ( "1028" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if ( "1009" ~ iValue ) {
		return -0.088358685417961172;
	}
	else if ( "1010" ~ iValue ) {
		return -0.088358685417961172;
	}
	else if ( "1003" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if ( "1029" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if ( "1025" ~ iValue ) {
		return -0.088358685417961172;
	}
	else if ( "1002" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if ( "1007" ~ iValue ) {
		return -0.15209722374351825;
	}
	else if ( "1030" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if ( "1022" ~ iValue ) {
		return 0.098520894416126548;
	}
	else if ( "1000" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if ( "1001" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if ( "1004" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if ( "1031" ~ iValue ) {
		return -0.19718884887755039;
	}
	else if( "1005" ~ iValue ) {
		return -0.088358685417961172;
	}
	return 0.41089397381763682;
}

function Kxen_RobustRegression_0_KxVar10(iValue) {
	gsub( "(^[ \t\"']*)|([ \t\"']*$)", "", iValue);
	if( iValue == ""  ) {
		return 0.058442477155306025;
	}
	if ( "93" ~ iValue ) {
		return -0.02719385664522175;
	}
	else if ( "87" ~ iValue ) {
		return -0.038699841409996015;
	}
	else if ( "82" ~ iValue ) {
		return -0.020266858906602413;
	}
	else if ( "76" ~ iValue ) {
		return -0.038699841409996015;
	}
	else if ( "77" ~ iValue ) {
		return -0.02719385664522175;
	}
	else if ( "71" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "81" ~ iValue ) {
		return -0.020266858906602413;
	}
	else if ( "67" ~ iValue ) {
		return -0.02719385664522175;
	}
	else if ( "72" ~ iValue ) {
		return 0.0062104164874676078;
	}
	else if ( "66" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "62" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "86" ~ iValue ) {
		return 0.0062104164874676078;
	}
	else if ( "68" ~ iValue ) {
		return 0.0062104164874676078;
	}
	else if ( "55" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "70" ~ iValue ) {
		return -0.038699841409996015;
	}
	else if ( "88" ~ iValue ) {
		return 0.093129776076551971;
	}
	else if ( "75" ~ iValue ) {
		return -0.038699841409996015;
	}
	else if ( "59" ~ iValue ) {
		return -0.038699841409996015;
	}
	else if ( "100" ~ iValue ) {
		return 0.11695780342442116;
	}
	else if ( "60" ~ iValue ) {
		return 0.0062104164874676078;
	}
	else if ( "54" ~ iValue ) {
		return -0.056891817188844077;
	}
	else if ( "63" ~ iValue ) {
		return 0.0062104164874676078;
	}
	else if ( "51" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "52" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "57" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "50" ~ iValue ) {
		return -0.038699841409996015;
	}
	else if ( "58" ~ iValue ) {
		return -0.056891817188844077;
	}
	else if ( "41" ~ iValue ) {
		return -0.056891817188844077;
	}
	else if ( "48" ~ iValue ) {
		return -0.02719385664522175;
	}
	else if ( "83" ~ iValue ) {
		return 0.093129776076551971;
	}
	else if ( "90" ~ iValue ) {
		return 0.11695780342442116;
	}
	else if ( "91" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "56" ~ iValue ) {
		return 0.0062104164874676078;
	}
	else if ( "89" ~ iValue ) {
		return 0.1563963249740114;
	}
	else if ( "49" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "44" ~ iValue ) {
		return -0.02719385664522175;
	}
	else if ( "65" ~ iValue ) {
		return 0.0062104164874676078;
	}
	else if ( "94" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "92" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "47" ~ iValue ) {
		return -0.045123256080564125;
	}
	else if ( "78" ~ iValue ) {
		return 0.11695780342442116;
	}
	else if ( "85" ~ iValue ) {
		return 0.11695780342442116;
	}
	else if ( "95" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "64" ~ iValue ) {
		return 0.1563963249740114;
	}
	else if ( "45" ~ iValue ) {
		return -0.020266858906602413;
	}
	else if ( "84" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "96" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "73" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "69" ~ iValue ) {
		return 0.1563963249740114;
	}
	else if ( "97" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "98" ~ iValue ) {
		return 0.16949852062828585;
	}
	else if ( "42" ~ iValue ) {
		return -0.02719385664522175;
	}
	else if ( "53" ~ iValue ) {
		return 0.11695780342442116;
	}
	else if( "74" ~ iValue ) {
		return 0.16949852062828585;
	}
	return 0.058442477155306025;
}


function apply_sensVal() {
	score=0;
	lInputs[4];
	lAllInputs[4];

	lAllInputs[0] = 0.0;
	score += lAllInputs[0];

	score += Kxen_RobustRegression_0_KxVar3($4);
	score += Kxen_RobustRegression_0_KxVar6($7);
	score += Kxen_RobustRegression_0_KxVar9($10);
	score += Kxen_RobustRegression_0_KxVar10($11);
	printf score;
}


BEGIN {
	id=0;
}
{
	printf id ", ";
	apply_sensVal();
	printf "\n";
	id++;
}
END {
}
