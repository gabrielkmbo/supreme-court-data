### Session 2 ###

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
summary(d)
dim(d)
head(d)
names(d)

## draw the distribution of callback rate
hist(d$call) # histogram (default y is frequency)
plot(density(d$call)) # density plot

# suppose you want to draw a density plot by race...
# first you plot the white subset
plot(density(d$call[d$race == "white"]),
     ylim = c(0, 10))
# then you add the line that's the black subset
lines(density(d$call[d$race == "black"]), col = "red")
# then you add the legend
legend(0.6, 5, # manually specifying the x- and y-coordinates of the legend
       legend = c("White", "Black"),
       col = c("black", "red"),
       lty = 1:2)

## how many unique first names are there in the dataset?
length(unique(d$firstname))

## how many of them are black names and white names, respectively?
# subset by race; get the vector; find unique values; calculate the length of the new vector
length(unique(d$firstname[d$race == "white"]))
length(unique(d$firstname[d$race == "black"]))

## calculate the average callback rates for black and white names
mean(d$call)
mean(d$call[which(d$race == "white")]) # whites' ave callback rate
mean(d$call[which(d$race == "black")]) # blacks' ave callback rate

mean(d$call[which(d$race == "white")]) - mean(d$call[which(d$race == "black")])


## what's the call back rate for each first name
n <- length(unique(d$firstname))
firstnames <- unique(d$firstname)

### Finding call back rates for black sounding names
# step 1: create storage
call.rate <- rep(NA, n)


# step 2: loop
i <- 3
mean(d$call[which(d$firstname == "Allison")])

mean(d$call[which(d$firstname == firstnames[i])])

call.rate[i] <- mean(d$call[which(d$firstname == firstnames[i])])

for (i in 1:n) {
  call.rate[i] <- mean(d$call[which(d$firstname == firstnames[i])])
}

call.rate
names(call.rate) <- firstnames

colnames()
rownames()
names()

cbind.data.frame(firstnames, call.rate)



### Finding call back rates for white sounding names
# step 1: create storage


# step 2: loop



## compare the distributions of average call back rate for black and white names
## make your plot prettier and save your plot




