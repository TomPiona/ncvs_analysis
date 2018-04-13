clear

do "/Users/ronaldwalker/econ154/ncvs_analysis/indiv.do"

*
* MERGING (this is the greatest thing to happen since sliced bread)
*

merge 1:m IDPER YEARQ using incident/36828-0004-Data.dta
drop if _merge != 3
drop _merge





// V3081 - NUMBER OF CRIME INCIDENT REPORTS (individual data-set)
// V4399 - REPORTED TO POLICE (incident report data-set)


/*
Police wouldn't help: Police wouldn't think it was important enough, wouldn't want to be bothered or get involved -- V4411
Police wouldn't help: Police would be inefficient, ineffective (they'd arrive late or not at all, wouldn't do a good job, etc.) -- V4412
Police wouldn't help: Police would be biased, would harass/insult respondent, cause respondent trouble, etc.-- V4413
Police wouldn't help: Offender was police officer -- V4414
*/