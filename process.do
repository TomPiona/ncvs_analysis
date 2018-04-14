// new file
clear

// close log if error
capture log close

// changing to right dir
cd "/Users/ronaldwalker/econ154/ncvs_analysis"




*
* 2016
*

use "2016/individual/36828-0003-Data.dta", clear

// running supplied do file that changes the missing data values to stata format instead of -99, etc.
do "2016/individual/36828-0003-Supplemental_syntax.do"
do "/Users/ronaldwalker/econ154/ncvs_analysis/indiv.do"

* MERGING (this is the greatest thing to happen since sliced bread)

// merging incident data
merge 1:m IDPER YEARQ using 2016/incident/36828-0004-Data.dta
drop if _merge != 3
drop _merge

// merging household data
merge m:1 IDHH YEARQ using 2016/household/36828-0002-Data.dta
drop if _merge != 3
drop _merge

// processing post merge
do "/Users/ronaldwalker/econ154/ncvs_analysis/post_merge.do"

save 2016, replace


*
* 2015
*

use "2015/individual/36448-0003-Data.dta", clear

// running supplied do file that changes the missing data values to stata format instead of -99, etc.
do "2015/individual/36448-0003-Supplemental_syntax.do"
do "/Users/ronaldwalker/econ154/ncvs_analysis/indiv.do"

* MERGING (this is the greatest thing to happen since sliced bread)

// merging incident data
merge 1:m IDPER YEARQ using 2015/incident/36448-0004-Data.dta
drop if _merge != 3
drop _merge

// merging household data
merge m:1 IDHH YEARQ using 2015/household/36448-0002-Data.dta
drop if _merge != 3
drop _merge

// processing post merge
do "/Users/ronaldwalker/econ154/ncvs_analysis/post_merge.do"

save 2015, replace




*
* 2014
*

use "2014/individual/36142-0003-Data.dta", clear

// running supplied do file that changes the missing data values to stata format instead of -99, etc.
do "2014/individual/36142-0003-Supplemental_syntax.do"
do "/Users/ronaldwalker/econ154/ncvs_analysis/indiv.do"

* MERGING (this is the greatest thing to happen since sliced bread)

// merging incident data
merge 1:m IDPER YEARQ using 2014/incident/36142-0004-Data.dta
drop if _merge != 3
drop _merge

// merging household data
merge m:1 IDHH YEARQ using 2014/household/36142-0002-Data.dta
drop if _merge != 3
drop _merge

// processing post merge
do "/Users/ronaldwalker/econ154/ncvs_analysis/post_merge.do"

save 2014, replace





