use "2016.dta", clear

append using "2015.dta"
append using "2014.dta"
append using "2013.dta"

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



// the OG
logit not_reported female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury, robust


logit not_reported female black hispanic age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury i.V4021B if 18<=crime<=20, robust

gen post_blm=0
replace post_blm=1 if YEARQ>2015
drop if 2014<YEARQ & YEARQ<2015