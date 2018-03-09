// new file
clear

// close log if error
capture log close

// changing to right dir
cd "\\Client\C$\Users\ronaldwalker\econ154\foc"

// loading one file
use "\\Client\C$\Users\ronaldwalker\econ154\foc\individual\36828-0003-Data.dta", clear

// running supplied do file that changes the missing data values to stata format instead of -99, etc.
do "\\Client\C$\Users\ronaldwalker\econ154\foc\individual\36828-0003-Supplemental_syntax.do"


// histogram of ages
hist V3013, width(1)


use "\\Client\C$\Users\ronaldwalker\econ154\foc\incident\36828-0004-Data.dta", clear

