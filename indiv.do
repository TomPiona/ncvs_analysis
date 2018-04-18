* 
* CLEANING / FEATURE ENGINEERING
*

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
gen non_white=0
replace non_white=1 if black==1 | hispanic==1

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

gen post_hs=0
replace post_hs=1 if some_college==1
replace post_hs=1 if BA==1
replace post_hs=1 if grad==1



* RESPONDENT GENDER

// V3017 - SEX (ORIGINAL)
gen female=0
replace female=1 if V3017==2



* V3054 THOUGHT CRIME BUT NO CALL POLICE

// THIS IS DEF ENDOGENOUS TO OUR OUTCOME (drop later?)
tab V3054
gen nocall=0
replace nocall=1 if V3054==1


* RENAMING VARIABLES

rename V3013 age