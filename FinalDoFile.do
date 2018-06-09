generate educyears=9
replace educyears=10 if educ=50
replace educyears=10 if educ==50
replace educyears=11 if educ==60
replace educyears=12 if educ==70
replace educyears=12 if educ==73
replace educyears=13 if educ==80
replace educyears=13 if educ==81
replace educyears=14 if educ==890
replace educyears=14 if educ==90
replace educyears=14 if educ==090
replace educyears=14 if educ==91
replace educyears=14 if educ==92
replace educyears=14 if educ==91
replace educyears=15 if educ==100
replace educyears=16 if educ==111
replace educyears=17 if educ==121
replace educyears=17 if educ==120
replace educyears=18 if educ==123
replace educyears=20 if educ==125
drop if uhrswork1 == 999
drop if uhrswork1 == 00
replace educyears=19 if educ==124
drop if uhrswork1 == 997
drop if uhrsworkt == 999
drop if uhrsworkt == 997
drop if uhrsworkly == 997 
drop if uhrsworkly == 997 
drop if uhrsworkly == 999
drop if educ==000
drop if educ==001
drop if educ==002
drop if occ==0000
drop if uhrsworkt ==999
drop if uhrsworkt ==997
drop if uhrsworkt ==000
drop if uhrsworkt ==0
drop if uhrsworkt ==99
generate male =1 if sex==2
replace male =0 if sex==1
drop male
generate male =1 if sex==1
replace male =0 if sex==2
generate profworker=0
replace profworker=1 if occ<4000
replace profworker=0 if occ=4000
replace profworker=0 if occ=4000
replace profworker=0 if occ=4000
replace profworker=0 if occ==4000
replace profworker=0 if occ=3955
replace profworker=0 if occ==3955
replace profworker=0 if occ==3945
replace profworker=0 if occ==3940
replace profworker=0 if occ==3930
replace profworker=0 if occ==3910
replace profworker=0 if occ==3900
replace profworker=0 if occ==3850
replace profworker=0 if occ==3840
replace profworker=0 if occ==3830
replace profworker=0 if occ==3740
replace profworker=0 if occ==3630
replace profworker=1 if occ==4930
replace profworker=1 if occ==6355
replace profworker=1 if occ==9330
regress uhrsworkly profworker
regress uhrsworkt profworker
regress uhrswork1 profworker
regress uhrsworkly profworker
regress uhrsworkt profworker educyears
regress uhrswork1 profworker educyears
regress uhrsworkly profworker educyears
regress uhrsworkt profworker educyears male i.race age
regress uhrswork1 profworker educyears male i.race age
regress uhrsworkly profworker educyears male i.race age
generate exp=age-educyears-6
generate expsq=exp^2
regress uhrsworkt profworker educyears male i.race exp expsq
generate lnhours = log( uhrswork1)
regress lnhours profworker educyears male i.race exp expsq
generate skilledworker=0
replace skilledworker=1 if profworker==1
summarize
ssc install estout
regress uhrswork1 skilledworker
regress uhrswork1 skilledworker
regress lnhours skilledworker
eststo
regress lnhours skilledworker educyears
essto
eststo
regress lnhours skilledworker educyears male exp expsq i.race
eststo
regress lnhours skilledworker educyears male exp expsq i.race [pw=wtsupp]
eststo
esttab
