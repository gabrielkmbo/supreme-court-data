## small vs big vote scalings comparisons
## loading estimated ideology based on
## only surveyed cases and based on all cases

load("all-vs-small-ideol-estimates.RData")

###############
## FIGURE S2 ##
###############

par(mfrow=c(1,3), pty="s")
#
plot(x.big.2010[16:1515], x.small.2010[16:1515],
     col="gray", xlim=c(-3,3), ylim=c(-3,3), bty="n", main="2010",
     xlab="All Cases Ideal Point Estimates",
     ylab="Surveyed Cases Ideal Point Estimates")
abline(0,1, lty=3)
points(x.big.2010[c(1,3,4,6,7,8,9,10,11)], 
       x.small.2010[c(1,3,4,6,7,8,9,10,11)],
       pch=19)
points(x.big.2010[12], x.small.2010[12], 
       pch=4, cex=2)
#
plot(x.big.2020[11:2010], x.small.2020[11:2010],
     col="gray", xlim=c(-3,3), ylim=c(-3,3), bty="n", main="2020",
     xlab="All Cases Ideal Point Estimates",
     ylab="Surveyed Cases Ideal Point Estimates")
abline(0,1, lty=3)
points(x.big.2020[1:9], x.small.2020[1:9],
       pch=19)
points(x.big.2020[10], x.small.2020[10], 
       pch=4, cex=2)
#
plot(x.big.2021[11:2168], x.small.2021[11:2168],
     col="gray", xlim=c(-3,3), ylim=c(-3,3), bty="n", main="2021",
     xlab="All Cases Ideal Point Estimates",
     ylab="Surveyed Cases Ideal Point Estimates")
abline(0,1, lty=3)
points(x.big.2021[1:9], x.small.2021[1:9],
       pch=19)
points(x.big.2021[10], x.small.2021[10], 
       pch=4, cex=2)
#
# NOTE: depending on your plot configuration
# legend may cover up large portions of the figure
# resize or omit legend command if necessary
legend('bottomright', c("respondents", "justices", "Court"),
       pch=c(1,19,4), col=c("gray", "black", "black"))



