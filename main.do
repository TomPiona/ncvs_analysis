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