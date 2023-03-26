# Linear-regression-model-Drill
In mining engineering, holes are often drilled through rock, using drill bits. As a drill hole gets deeper, additional rods are added to the drill. The business problem relates to whether drilling is faster using dry drilling holes or wet drilling holes.
Using dry drilling holes involves forcing compressed air down the drill rods to flush the cuttings and drive the hammer. Using wet drilling holes involves forcing water rather than air down the hole. Data have been collected from a sample of 50 drill holes that contains measurements of the time to drill each additional 5 feet (in minutes), the depth (in feet), and whether the hole was a dry drilling hole or a wet drilling hole

OUTPUT AND INTERPRETATION
a.	State the multiple regression equation.

time(y) = b0 + b1*depth + b2*type
a = lm(time~depth+type)
b0 = 8.01, b1 = 0.01, b2 = -2.11

Time (y) = 8.01 + 0.01*depth (x1) -2.11*type (x2)
Output from R
 

b.	Interpret the regression coefficients in (a)
Dry = 1
Wet = 0

Since dry and wet type are of categorical nature, we compare the time taken by wet and dry drilling type. Based on the output this means dry type takes 2.11 minutes lesser than the wet drilling type.

The time increases by 0.01 minutes for every one-foot increase in depth.

c.	Predict the mean additional drilling time for a dry drilling hole at a depth of 100 feet. Construct a 95% confidence interval estimate and a 95% prediction interval.

predict(a, newdata, interval="predict")
       fit     lwr      upr
6.427634 4.92304 7.932228

predict(a, newdata, interval="confidence")
       fit      lwr      upr
6.427634 6.209587 6.645681

The mean additional drilling time using dry drilling type is 6.43 minutes for a dry drilling hole at a depth of 100 feet.

d.	Perform a residual analysis on the results and determine whether the regression assumptions are valid.

LINE assumption
  
Linearity – 1. There is a linear relationship between the residuals and fitted value of Y (time)

Independence

Output: Durbin-Watson test
DW = 1.3577, p-value = 0.0002834
alternative hypothesis: true autocorrelation is greater than 0

DW value is 1.35 which is closer to 2. This signifies there low correlation between the residuals and the fitted value of y

Normality – 2 The residual values are normally distributed which can be understood from the normal Q-Q plot

Equal variance – 3 There is homoscedasticity between the residual values signifying equal variance

There is no deviation in the LINE residual analysis, hence the MLR analysis can be performed.

e.	Is there a significant relationship between additional drilling time and the two independent variables (depth and type of drilling hole) at the 0.05 level of significance?

The p- value for the depth and type is 0.00 which is lesser than 0.05. This means that both depth and drilling type (wet or dry) has a statistically significant impact on time.



f. At the 0.05 level of significance, determine whether each independent variable contributes to the regression model. Indicate the most appropriate regression model for this set of data.
From the output from the additive model, both depth and type of drill has p-value of 0.00 which is lesser than 0.05 level of significance. This implies that both these independent variable (depth and type of drill) makes contribution to the regression model and it has a statistically significant impact on the drilling time.
Additive model
 
Predicted and actual value of time using additive model
 
Rmse
0.6
Mae
0.46
Prediction error rate for additive model
0.082
f.	Construct a 95% confidence interval estimate of the population slope for the relationship between additional drilling time and depth.
                  2.5 %       97.5 %
(Intercept)  7.673111709  8.346986250
depth        0.003164621 0.007291082
type        -2.402942087 -1.807457913
The 95% confidence interval for depth is [0.00316, 0.00729]. Since this confidence interval doesn’t contain the value 0, we can conclude that there is a statistically significant association between depth and drill time.
g.	Construct a 95% confidence interval estimate of the population slope for the relationship between additional drilling time and the type of hole drilled.

2.5 %       97.5 %
(Intercept)  7.673111709  8.346986250
depth        0.003164621  0.007291082
type        -2.402942087 -1.807457913
The 95% confidence interval for type is [-2.402, -1.807] . Since this confidence interval doesn’t contain the value 0, we can conclude that there is a statistically significant association between type of hole drilled and drill time.
i. Compute and interpret the adjusted r2.
 
Adjusted r2 value is 0.69. 
j. Compute the coefficients of partial determination and interpret their meaning.
$estimate
            time     depth       type
time   1.0000000 0.4547574 -0.8185271
depth  0.4547574 1.0000000  0.3722312
type  -0.8185271 0.3722312  1.0000000
The partial correlation value of depth and type is 0.3, which means that there is low correlation between depth and type of drill.
k. What assumption do you need to make about the slope of additional drilling time with depth?
Dry = 1
Wet = 0

Since dry and wet type are of categorical nature, we compare the time taken by wet and dry drilling type. Based on the output this means dry type takes 2.11 minutes lesser than the wet drilling type.

The time increases by 0.01 minutes for every one-foot increase in depth.
l. Add an interaction term to the model and, at the 0.05 level of significance, determine whether it makes a significant contribution to the model.
The interaction variable (depth: type) has a p value of 0.335 which is more than the significance level of 0.05. Hence (depth: type – interactive variable) doesn’t not have a statistically significant impact on the drill time. Depth and type independently seem to be a better predictor of time than (depth: type)
Interaction model
 
Predicted and actual values of time – interaction model
 

Rmse
0.75542
Mae
0.5866
Prediciton error rate for interaction model
0.099
m. On the basis of the results of (f) and (l), which model is most appropriate? Explain.
The prediction error rate of the additive model (0.08) which is lesser than the interactive model (0.09), hence additive model would be better option. Moreover, the interaction variable (depth: type) has a p value of 0.335 which is more than the significance level of 0.05. Which means (depth: type – interactive variable) doesn’t not have a statistically significant impact on the drill time. Hence it would be better to go with the additive model.
n. What conclusions can you reach concerning the effect of depth and type of drilling hole on drilling time?
Time (y) = 8.01 + 0.01*depth (x1) -2.11*type (x2)
Substituting the values of depth = 5 and type = 1 where 1 means dry to determine drill time (y) after standardising the co-efficient of depth and type
Y = 8.01 + 0.28(5) – 0.785(1)
Time taken = 8.625 minutes
Substituting the values of depth = 5 and type = 0 where 0 means wet to determine drill time (y)
Y = 8.01 + 0.28(5) – 0.785(0)
Time taken = 9.41 minutes
Thus, for every feet increase in depth and when the drill type is dry the additional time taken is 8.625 mins and for every feet increase in depth and when the drill type is wet the additional time taken is 9.41 mins which is more than the dry drill type.
