gen not_reported=0
replace not_reported=1 if V4399==2

rename V4529 crime

gen incompetance=0
replace incompetance=1 if V4411==1
replace incompetance=1 if V4412==1
replace incompetance=1 if V4413==1
replace incompetance=1 if V4414==1
replace incompetance=1 if V4415==1
replace incompetance=1 if V4416==1
replace incompetance=1 if V4417==1
replace incompetance=1 if V4418==1

gen threatened=0
replace threatened=1 if V4109==1

gen urban=0
replace urban=1 if V2016==1

replace V4248=0 if V4248 > 96
rename V4248 num_offenders
gen multiple_offenders=0
replace multiple_offenders=1 if num_offenders>1

gen weapon_involved=0
replace weapon_involved=1 if V4049==1

gen known_offender=0
replace known_offender=1 if V4241==1 | V4256==1 | V4256==2

gen minor_injury=0
replace minor_injury=1 if V4120==1

gen major_injury=0
replace major_injury=1 if V4112==1 | V4113==1 | V4114==1 | V4115==1 | V4116==1 | V4117==1 | V4118==1 | V4119==1 

//logit incompetance female black hispanic post_hs age V4248 i.crime i.V2125, robust
// V3081 - NUMBER OF CRIME INCIDENT REPORTS (individual data-set)
// V4399 - REPORTED TO POLICE (incident report data-set)