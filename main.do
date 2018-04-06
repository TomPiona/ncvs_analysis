// new file
clear

// close log if error
capture log close

// changing to right dir
cd "/Users/ronaldwalker/econ154/ncvs_analysis"





* 
* CLEANING / FEATURE ENGINEERING
*

// loading one file
use "individual/36828-0003-Data.dta", clear

// running supplied do file that changes the missing data values to stata format instead of -99, etc.
do "individual/36828-0003-Supplemental_syntax.do"

* CREATING RACE VARIABLES

decod V3024, generate(hispanic_org)
gen hispanic=0
replace hispanic=1 if hispanic_org=="Yes"
drop hispanic_org


decod V3023A, generate(race2)
gen white=0
replace white=1 if race2=="White only" & hispanic==0
gen black=0
replace black=1 if race2=="Black only" & hispanic==0
drop race2


// dropping the rows if they are not hispanic, white, or black
drop if hispanic!=1 & white!=1 & black!=1


* CREATING EDUCATION VARIABLES

gen less_than_hs=0
gen hs=0
gen some_college=0
gen BA=0
gen grad=0
// less than hs grad
replace less_than_hs=1 if V3020<28
// hs grad
replace hs=1 if V3020==28
// some college or associates
replace some_college=1 if V3020==40 | V3020==41
// bachelor's degree
replace BA=1 if V3020==42
// includes masters, prof school, doctorate
replace grad=1 if V3020>42 & V3020<46

local edu "less_than_hs hs some_college BA grad"

* V3054 THOUGHT CRIME BUT NO CALL POLICE
// THIS IS DEF ENDOGENOUS TO OUR OUTCOME (drop later?)
tab V3054, gen(nocall)





//use "incident/36828-0004-Data.dta", clear




* RENAMING VARIABLES
rename V3013 age





* 
* EXPLORATION
*

// histogram of ages
hist age, width(1)

// education levels
sum(`edu')
display "Proportion represented by these levels of education:"  _continue
display (.2014826 + .2496841 + .2588116 + .1729288 + .0968375)

// crosstab-ing not calling the police and having been broken into
// shows a loack of independence between the two 
// (main contribution from those that've been broken into before and reported if you use cchi2)
tab nocall1 V3036, chi2





* 
* REGRESSION / ANALYSIS
*

// logit w/ thought crime but no police
logit nocall1 V3032 V3036
logit nocall2 V3032 V3036 hispanic black `edu' age

// V3081 - NUMBER OF CRIME INCIDENT REPORTS (individual data-set)
// V4399 - REPORTED TO POLICE (incident report data-set)
