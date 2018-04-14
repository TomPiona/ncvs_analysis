* 
* EXPLORATION
*

// histogram of ages
// hist age, width(1)

// education levels
// sum(`edu')
display "Proportion represented by these levels of education:"  _continue
display (.2014826 + .2496841 + .2588116 + .1729288 + .0968375)

// crosstab-ing not calling the police and having been broken into
// shows a loack of independence between the two 
// (main contribution from those that've been broken into before and reported if you use cchi2)
tab nocall1 V3036, chi2

* 
* REGRESSION / ANALYSIS
*

local races "hispanic black"
local other_vars "age"

// logit w/ thought crime but no police
// logit nocall1 V3032 V3036
// logit nocall2 V3032 V3036 `races' `edu' `other_vars'

// V3081 - NUMBER OF CRIME INCIDENT REPORTS (individual data-set)
// V4399 - REPORTED TO POLICE (incident report data-set)


/*
Police wouldn't help: Police wouldn't think it was important enough, wouldn't want to be bothered or get involved -- V4411
Police wouldn't help: Police would be inefficient, ineffective (they'd arrive late or not at all, wouldn't do a good job, etc.) -- V4412
Police wouldn't help: Police would be biased, would harass/insult respondent, cause respondent trouble, etc.-- V4413
Police wouldn't help: Offender was police officer -- V4414
*/
