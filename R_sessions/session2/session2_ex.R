
## clean up memory and set working directory
rm(list = ls())
getwd()
dir()



#########################
# The Resume Experiment
#########################

## load dataset
d <- read.csv("resume.csv")

## take a look at the dataset

names(d)

d$call
table(d$call)

## draw the distribution of callback rate
hist(d$call)

d$female <- ifelse(d$sex == "female", 1, 0)

hist(d$female)


plot(density(d$call))




## how many unique first names are there in the dataset?
unique(d$race)

length(unique(d$firstname))


## how many of them are black names and white names, respectively?

world.pop[c(2,3)]

firstname.black <- d$firstname[which(d$race == "black")]
length(unique(firstname.black))

length(unique(d$firstname[which(d$race == "black")]))

length(unique(d$firstname[which(d$race == "white")]))

bl <- d[which(d$race == "black"), ]
length(unique(bl$firstname))

length(unique(d[which(d$race == "white"), "firstname"]))

wh <- d[which(d$race == "white"), ]

## calculate the average callback rates for black and white names

mean(bl$call)
mean(wh$call)

mean(wh$call) - mean(bl$call)


## what's the call back rate for each first name

avg.call.w <- mean(d[which(d$race == "white"), "call"])
avg.call.b <- mean(d[which(d$race == "black"), "call"])

for (i in 1:10) {
  print(i)
}

names.b <- unique(d$firstname[which(d$race == "black")])
names.w <- unique(d$firstname[which(d$race == "white")])

rep(0,5)
call.bl <- rep(NA, length(names.b))


call.wh <- rep(NA, length(names.w))

for (i in 1:18) {
  this.name <- names.b[i]
  print(this.name)
  print(mean(d[which(d$firstname == this.name), "call"]))
  call.bl[i] <- mean(d[which(d$firstname == this.name), "call"])
}

for (i in 1:18) {
  this.name <- names.w[i]
  print(this.name)
  print(mean(d[which(d$firstname == this.name), "call"]))
  call.wh[i] <- mean(d[which(d$firstname == this.name), "call"])
}



### Finding call back rates for black sounding names
# step 1: create storage
bl.rate <- rep(NA, 18)
bl.names <- unique(d$firstname[which(d$race == "black")])

# step 2: loop

for (i in 1:18xΩ) {
  name <- bl.names[i]
  bl.rate[i] <- mean(d$call[which(d$firstname == name)])
}

plot(density(bl.rate))
abline(v = mean(bl.rate))

wh.rate <- rep(NA, 18)
wh.names <- unique(d$firstname[which(d$race == "white")])
for (i in 1:18) {
  name <- wh.names[i]
  wh.rate[i] <- mean(d$call[which(d$firstname == name)])
}

wh.rate

### Finding call back rates for white sounding names
# step 1: create storge


# step 2: loop



## compare the distributions of average call back rate for black and white names
## make your plot prettier and save your plot

dens1 <- density(call.wh)
dens2 <- density(call.bl)

plot(dens1, main = "Density Plot", xlim = range(c(dens1$x, dens2$x)), ylim = range(c(dens1$y, dens2$y)), 
     xlab = "X", ylab = "Density", col = "blue", lwd = 2)
lines(dens2$x, dens2$y, col = "red", lwd = 2)

legend("topright", legend = c("Dataset 1", "Dataset 2"), col = c("blue", "red"), lty = 1, lwd = 2)


plot(density(call.bl), density(call.wh))
plot(density(call.wh))
