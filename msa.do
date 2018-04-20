use "/Users/ronaldwalker/econ154/ncvs_analysis/MSA/DS0002/04576-0002-Data.dta", clear
do "/Users/ronaldwalker/econ154/ncvs_analysis/MSA/DS0002/04576-0002-Supplemental_syntax.do"

gen post_rk=0
replace post_rk=1 if V2003>922
drop if V2003<904
drop if V2003>924
drop if V2003>911 & V2003<923

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

gen female=0
replace female=1 if V3018==2

gen post_hs=0
replace post_hs=1 if V3020>12

gen black_post=post_rk *black 
gen hispanic_post=post_rk *hispanic  

logit reported female age black hispanic post_hs post_rk black_post hispanic_post i.MSACC, robust
logit reported female age black hispanic post_hs post_rk black_post hispanic_post i.MSACC i.V4529, robust

drop if MSACC != 17

logit reported female age black hispanic post_hs post_rk black_post hispanic_post, robust