eststo clear
eststo: quietly logit not_reported female non_white age post_hs urban weapon_involved multiple_offenders known_offender minor_injury major_injury, robust
esttab using og.csv