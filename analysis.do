do main
/*
tab2 black not_reported, r
tab2 black incompetance if not_reported==1, r

tab2 hispanic not_reported, r
tab2 hispanic incompetance if not_reported==1, r

tab2 white not_reported, r
tab2 white incompetance if not_reported==1, r

tab2 female not_reported, r
tab2 female incompetance if not_reported==1, r


logit not_reported  female black hispanic post_hs age num_offenders i.crime threatened weapon_involved urban i.V4021B, robust
logit not_reported  female black hispanic post_hs age num_offenders i.crime threatened weapon_involved urban, robust
logit incompetance female black hispanic post_hs age num_offenders i.crime threatened weapon_involved urban i.V4021B if not_reported==1, robust 
logit incompetance female black hispanic post_hs age num_offenders i.crime threatened weapon_involved urban, robust


gen hc_1=0
replace hc_1=1 if V4526A==1

gen hc_2=0
replace hc_2=1 if V4526B==1

gen hc_3=0
replace hc_3=1 if V4526C==1

gen hc_4=0
replace hc_4=1 if V4526D==1

gen hc_5=0
replace hc_5=1 if V4526E==1

gen hc_6=0
replace hc_6=1 if V4526F==1

gen hc_7=0
replace hc_7=1 if V4526G==1

gen hc_8=0
replace hc_8=1 if V4526H==1
*/

gen reported=1
replace reported=0 if not_reported==1

gen rape=0
replace rape=1 if crime==1 | crime==2
gen sex_assault=0
replace sex_assault=1 if crime==3 | crime==4 | crime==15 | crime==16
gen robbery=0
replace robbery=1 if crime==5 | crime==6 | crime==7 | crime==8 | crime==9 | crime==10
gen assault=0
replace assault=1 if crime==11 | crime==12 | crime==13 | crime==14 | crime==17
gen verbal=0
replace verbal=1 if crime==18 | crime==19 | crime==20
gen burglary=0
replace burglary=1 if crime==31 | crime==32 | crime==33
gen gta=0
replace gta=1 if crime==40 | crime==41
gen theft=0
replace theft=1 if crime==54 | crime==55 | crime==56 | crime==57 | crime==58 | crime==59
gen pick_pock=0
replace pick_pock=1 if crime==21 | crime==22 | crime==23


gen attempted=0
replace attempted=1 if crime==2 | crime==8 | crime==9 | crime==10 | crime==12 | crime==22 | crime==33 | crime==41 | crime==59


// the OG
logit reported female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury, robust
est sto m1

logit reported female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.crime, robust
est sto m2

logit reported female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury rape sex_assault robbery assault verbal burglary gta theft pick_pock attempted, robust
est sto m3

logit reported female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.crime, robust
est sto m4

logit reported female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury rape sex_assault robbery assault verbal burglary gta theft pick_pock attempted, robust
est sto m5

esttab m1 m2 m3 m4 m5 using reported.csv, replace

logit incompetance female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury if reported==0, robust
est sto m1

logit incompetance female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.crime if reported==0, robust
est sto m2

logit incompetance female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury rape sex_assault robbery assault verbal burglary gta theft pick_pock attempted if reported==0, robust
est sto m3

logit incompetance female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.crime if reported==0, robust
est sto m4

logit incompetance female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury rape sex_assault robbery assault verbal burglary gta theft pick_pock attempted if reported==0, robust
est sto m5

esttab m1 m2 m3 m4 m5 using incomp.csv, replace




gen post_blm=0
replace post_blm=1 if YEARQ>2015
drop if (2014<YEARQ & YEARQ<2015)
gen bt=post_blm * black 
gen ht=post_blm * hispanic 

logit reported female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury rape sex_assault robbery assault verbal burglary gta theft pick_pock attempted post_blm bt ht, robust
est sto m1

logit reported female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury i.crime post_blm bt ht, robust
est sto m2

logit incompetance female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury rape sex_assault robbery assault verbal burglary gta theft pick_pock attempted post_blm bt ht if reported==0, robust
est sto m3

logit incompetance female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.crime post_blm bt ht if reported==0, robust
est sto m4

logit incompetance female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.crime post_blm bt ht, robust
est sto m4

esttab m1 m2 m3 m4 using postblm.csv, replace

/*

tab2 incompetance reported 

logit reported female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury hc_*, robust

logit reported female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.V4021B if 18<=crime<=20, robust


gen post_blm=0
replace post_blm=1 if YEARQ>2015
drop if 2014<YEARQ & YEARQ<2015
gen bt=post_blm * black 
gen ht=post_blm * hispanic 

logit reported female black hispanic post_blm bt ht age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.V4021B
*/