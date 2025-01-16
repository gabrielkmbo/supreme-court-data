##################################
#### Introduction to R        ###
#### Session 3                ###
##################################

## Bellwether counties and the 2020 Election ##

## 1. load data and take a look
load("election2020.RData")
ls()
head(d)

## 2. plot the distributions of county-level democratic winning margin
# in 2016 and 2020 in one plot; what do you find?
# hint: overlay one density plot on the top of the other
plot(density(d$dem_16))
lines(density(d$dem_20), col = 2)

## 3. draw a scatterplot of democratic winning margin in 2016 and 2020
plot(d$dem_16, d$dem_20, xlim = c(-1, 1), ylim = c(-1, 1),
     xlab = "Democratic Vote Margin, 2016",
     ylab = "Democratic Vote Margin, 2020",
     cex = 0.8, col = "#77777750")

## 4. add a 45-degree line
abline(a = 0, b = 1, col = 2)
abline(v = 0, h = 0, col = 4, lty = 2)

## 5. mark the "bellwether" counties on the plot
bw <- which(d$bellwether == 1)
length(bw)
points(d$dem_16[bw], d$dem_20[bw], col = 2, pch = 16)

## 6. fit a regression using non-bellwether counties and report your finding
# hint: reg <- lm(y ~ x, data = d); summary(reg)
reg.full <- lm(dem_20 ~ dem_16, data = d)
summary(reg)

reg <- lm(dem_20 ~ dem_16, data = d[which(d$bellwether == 0), ])
summary(reg)

reg <- lm(dem_20 ~ dem_16, data = d[-bw, ])
summary(reg)
coef(reg)

## 7. add the regression line to the plot
# hint: abline(reg)
abline(reg, col = "blue")

abline(a = coef(reg)[1], b = coef(reg)[2], col = "orange")

## 8. using your regression model and the democratic winning margin in 2016
# in "bellwether counties", predict the democratic winning margin in 2020
# for those counties
# hint: extract the regression coefficients first using reg$coefficients

# y = beta0 + beta1 * x 
coefs <- reg$coefficients
coefs <- coef(reg)
beta0 <- coefs[1]
beta1 <- coefs[2]

bw.pred.2020 <- beta0 + beta1 * d$dem_16[bw]


## 9. based on your model, how many of the 19 counties are predicted to have 
# a Trump majority in 2020?
sum(bw.pred.2020 < 0)

## 10. calculate the number of Clinton-Biden countries and the number of total votes
q1 <- which(d$dem_16 >= 0 & d$dem_20>= 0)
q1.n <-length(q1)
q1.v <- sum(d$total_20[q1])/1e6

# 474
# 84.5M

#----#

## (bonus) 11. beautify your plot; consider the following element

# 11.1 change the size of each dot based on the number of total votes in that county
# hint: the "cex" option

# 11.2 add text in each of the four quadrant

# 11.3 add grid to mark the four quadrant

# 11.4 adjust the symbol and color for the data points

# 11.5 add background color to the four quadrant

library(RColorBrewer) 
display.brewer.all()
mycol<-brewer.pal(4,"Pastel1")

q1 <- which(d$dem_16 >= 0 & d$dem_20>= 0)
(q1.n <- length(q1))
(q1.v <- sum(d$total_20[q1])/1e6)

q2 <- which(d$dem_16 < 0 & d$dem_20>= 0)
(q2.n <- length(q2))
(q2.v <- sum(d$total_20[q2])/1e6)

q3 <- which(d$dem_16 < 0 & d$dem_20 < 0)
(q3.n <- length(q3))
(q3.v <- sum(d$total_20[q3])/1e6)

q4 <- which(d$dem_16 >= 0 & d$dem_20 < 0)
(q4.n <- length(q4))
(q4.v <- sum(d$total_20[q4])/1e6)


plot(1, xlim = c(-1,1), ylim = c(-1, 1), type = "n", 
     xlab = "Democratic Vote Margin, 2016",
     ylab = "Democratic Vote Margin, 2020")
polygon(x = c(0, 2, 2, 0), y = c(0, 0, 2, 2), col = paste0(mycol[1],"50"))
polygon(x = c(-2, 0, 0, -2), y = c(0, 0, 2, 2), col = paste0(mycol[2],"50"))
polygon(x = c(0, 2, 2, 0), y = c(0, 0, -2, -2), col = paste0(mycol[3],"50"))
polygon(x = c(-2, 0, 0, -2), y = c(0, 0, -2, -2), col = paste0(mycol[4],"50"))
box()
abline(v = 0, h = 0, col = 1, lty = 3)
abline(v = seq(-1, 1, 0.25), h = seq(-1, 1, 0.25), col = "#77777750")
points(d$dem_16, d$dem_20, col = "#33333350", 
       cex = sqrt(d$total_20/max(d$total_20)*10))
points(d$dem_16, d$dem_20, col = "#77777750", 
       cex = sqrt(d$total_20/max(d$total_20)*10), pch = 16)
bw <- which(d$bellwether == 1)
points(d$dem_16[bw], d$dem_20[bw], col = "white", pch = 16, cex = 1)
points(d$dem_16[bw], d$dem_20[bw], col = 2, pch = 16, cex = 0.8)
abline(a = 0, b = 1, col = 2, lty = 3)
text(0.5, 0.8, paste0("Clinton-Biden\n","(",q1.n," counties,\n",round(q1.v,1)," M voters)"))
text(-0.5, 0.8, paste0("Clinton-Biden\n","(",q2.n," counties,\n",round(q2.v,1)," M voters)"))
text(-0.5, -0.8, paste0("Clinton-Biden\n","(",q3.n," counties,\n",round(q3.v, 1)," M voters)"))
text(0.5, -0.8, paste0("Clinton-Biden\n","(",q4.n," counties,\n",round(q4.v,1)," M voters)"))


