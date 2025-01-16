version 18
set more off
display "Hello world!"
display 2 + 2
display sqrt(2)
display round(sqrt(2), .01)
di normal(1.96)
sysuse lifeexp.dta
describe
d
notes
browse
browse, nolabel
tabulate region
tabulate region, nolabel
label list region
numlabel region, add
tabulate region
numlabel region, remove
tab region
summarize
su gnppc
su gnppc, detail
codebook, compact
codebook
list
list, nolabel
list country gnppc
list if lexp > 78
list in 1/3
sort lexp
browse
list in 1/4
gsort -lexp
list in 1/4
* How many countries in each region
tab region
* Which countries are included in each region?
list if region == 1
list if region == 2
list if region == 3
* What if we want countries by region in alpha order?
sort country
list if region == 1
tab country if region == 1
tab country if region == 2
tab country if region == 3
bysort region: tab country
* Find the mean, median, range of gnppc
su gnppc, det
* Find the 4 countries with the lowest gnppc
sort gnppc
list in 1/4
list in 1/5
* find the 4 with the fastest population growth
gsort -popgrowth
list in 1/5
tab p
* for which countries is gnppc missing?
list if gnppc == .
histogram lexp
histogram lexp, frequency
histogram lexp, frequency title("My Favorite SRC Histogram")
histogram lexp, frequency title("My Favorite SRC Histogram") subtitle("We are having fun!")
histogram lexp, frequency title("My Favorite SRC Histogram") subtitle("We are having fun!") scheme(economist)
graph export myhistogram.pdf, replace
