use "/Users/ronaldwalker/econ154/ncvs_analysis/MSA/DS0002/04576-0002-Data.dta", clear
do "/Users/ronaldwalker/econ154/ncvs_analysis/MSA/DS0002/04576-0002-Supplemental_syntax.do"

/*
gen post_rk=0
replace post_rk=1 if V2003>922
drop if V2003<904
drop if V2003>924
drop if V2003>911 & V2003<923
*/


gen edate = mdy(V3025, V3026, V3027)
gen rk_date = mdy(4, 29, 1992)
gen time_since=edate-rk_date 
gen before_rk = mdy(3, 3, 1991)
gen days_before = before_rk - edate 


gen incident_date=mdy(V4014, 1, V4015)
replace time_sin=incident_date-rk_date

drop if time_since>180
drop if days_before>365
drop if days_before<0 & time_since<0
gen post_rk=0
replace post_rk=1 if time_since>0
format edate %d

gen post_time=0
replace post_time=time_since if post_rk==1


gen reported=0
replace reported=1 if V4399==1


gen black=0
gen white=0
gen hispanic=0
replace white=1 if V3023==1 & V3024==2
replace black=1 if V3023==2 & V3024==2
replace hispanic=1 if V3024==1
drop if black==0 & white==0 & hispanic==0

rename V3014 age

rename V4529 crime

gen female=0
replace female=1 if V3018==2

gen post_hs=0
replace post_hs=1 if V3020>12

gen black_post=post_rk *black 
gen hispanic_post=post_rk *hispanic  

logit reported female age black hispanic post_hs post_rk black_post hispanic_post i.MSACC, robust
logit reported female age black hispanic post_hs post_rk black_post hispanic_post i.MSACC i.crime, robust
logit reported female age black hispanic post_hs post_rk black_post hispanic_post i.MSACC i.crime [pweight= crime], robust
logit reported female age black hispanic post_hs post_rk black_post hispanic_post post_time i.MSACC i.crime [pweight= crime]

//drop if MSACC != 17

//logit reported female age black hispanic post_hs post_rk black_post hispanic_post, robust
