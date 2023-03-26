library(readxl)
getwd()
drill_data=read_excel("Drill.xlsx",sheet = 1,col_names=TRUE)
drill_data

drill=drill_data

drill=as.data.frame(drill)
drill
for (i in 1:nrow(drill))
{
  if (drill$Type[i]=='dry')
  {
    drill$Type[i]=1
  }else
  {
    drill$Type[i]=0
  }
}

drill
typeof(drill)

depth = drill$Depth
time = drill$Time
type = drill$Type
type=as.numeric(type)
type

library(fastDummies) 

#Step1: Find correlation between time and depth; time and type
cor(depth,time)
plot(depth, time)

cor(type,time)
plot(type,time)

#Step2: Creating linear MLR eq
##LINE assumptions
require(jtools)
b=data.frame(time,depth,type)
a = lm(time~depth+type, data = b)

#Residual analysis
par(mfrow = c(2, 2)) # for plots in same window
plot(a)
summ(a)

##Scaling
library (lm.beta)
lm.beta(a)

#Step3: Check for VIF
summ (a, vifs=T,confint = T) # VIF to test multi-collinearity

#correlation matrix
b=data.frame(time,depth,type)
pairs(b)

#install and load the GGally library
install.packages("GGally")
library(GGally)

#generate the pairs plot
ggpairs(b)

#Partial correlation
require (ppcor) 
ppcor::pcor(b)


##
newdata=data.frame(depth=100, type = 1)

predict(a, newdata, interval="predict")
predict(a, newdata, interval="confidence")

##Durbin-watson test
require(lmtest)
dwtest(a)

require(lm.beta)
lm.beta(a) ## what is standardized coefficient?
print(lm.beta(a), digits = 2)


###### INTERACTION model
cv=sample(2,nrow(drill),replace=TRUE, prob=c(.8,.2))
train=drill[cv==1,]
test=drill[cv==2,]
nrow(test)
nrow(train)
head(train)
head(test)

#MLR Model cross validation
k=lm(Time~Depth:Type+Depth+Type,train)
require(jtools)
summ(k)

#prediction
pred=predict(k,test)
pred
##predicted value of Y based on training model using test data
test$Time #acutal value of Y arrived using test data

require (Metrics)
rmse(test$Time,pred)
mae(test$Time,pred)

#prediction error rate
rmse(test$Time,pred)/mean(test$Time)

##Additive model
cv1=sample(2,nrow(drill),replace=TRUE, prob=c(.8,.2))
train1=drill[cv1==1,]
test1=drill[cv1==2,]
nrow(test1)
nrow(train1)
head(train)
head(test)

#MLR Model cross validation
j=lm(Time~Depth+Type,train1)
require(jtools)
summ(j)

#prediction
pred_a=predict(j,test1)
pred_a
##predicted value of Y based on training model using test data
test$Time #acutal value of Y arrived using test data

require (Metrics)
rmse(test$Time,pred_a)
mae(test$Time,pred_a)

#prediction error rate
rmse(test$Time,pred_a)/mean(test$Time)


##95% confidence interval
library(stats)
library("MASS")
confint(a)

