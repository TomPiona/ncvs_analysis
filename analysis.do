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

// the OG
logit not_reported female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury, robust

logit not_reported female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury hc_*, robust



/*
logit not_reported female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.V4021B if 18<=crime<=20, robust

gen post_blm=0
replace post_blm=1 if YEARQ>2015
drop if 2014<YEARQ & YEARQ<2015
gen bt=post_blm * black 
gen ht=post_blm * hispanic 

*/