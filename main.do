// new file
clear

// close log if error
capture log close

// changing to right dir
cd "/Users/ronaldwalker/econ154/ncvs_analysis"

// loading one file
use "individual/36828-0003-Data.dta", clear

// running supplied do file that changes the missing data values to stata format instead of -99, etc.
do "individual/36828-0003-Supplemental_syntax.do"


// histogram of ages
hist V3013, width(1)

// create dummy variables for THOUGHT CRIME BUT NO CALL POLICE
tab V3054, gen(nocall)
// then logit w/ it
logit nocall1 V3032 V3036

tab nocall1 V3036



// CREATING RACE VARIABLES

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

//use "incident/36828-0004-Data.dta", clear