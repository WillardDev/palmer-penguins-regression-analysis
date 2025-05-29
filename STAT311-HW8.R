# STAT311 - Homework 8
# Name: [Your Name Here]

# You may need to install the relevant libraries, but 
#  only run the following command once, ever, do not
#  leave it uncommented in your submission.
install.packages("palmerpenguins")
library(palmerpenguins)

makeplot<-function(){
  plot(penguins$bill_depth_mm, penguins$bill_length_mm, 
       col=c('black','blue','orange')[as.factor(penguins$species)],
       pch=c(1,2)[as.factor(penguins$sex)])
  legend("topleft", legend=c(levels(penguins$species),"female","male"), 
         col=c('black','blue','orange','black','black'), pch=c(5,5,5,1,2))
}

# Question 1
# Fit a model to predict bill length from bill depth for
#  the palmerpenguins data, just called 'penguins'

# Simple linear regression: bill_length ~ bill_depth
model1 <- lm(bill_length_mm ~ bill_depth_mm, data = penguins)

# What is the estimated intercept term of the model?
q1.a <- model1$coefficients[[1]]

# What is the estimated slope term of the model?
q1.b <- model1$coefficients[[2]]

# Predict the expected bill length for a penguin with
#  a bill depth of 14mm.
q1.c <- predict(model1, newdata = data.frame(bill_depth_mm = 14))[[1]]

# Construct a 90% prediction interval for the 
#  bill length of a penguin with a bill depth of 19mm
pred_interval_19 <- predict(model1, newdata = data.frame(bill_depth_mm = 19), 
                            interval = "prediction", level = 0.90)
q1.d <- c(pred_interval_19[2], pred_interval_19[3])

# Construct a 99% confidence interval for the average bill
#  length of a penguin with a bill depth of 19mm.
conf_interval_19 <- predict(model1, newdata = data.frame(bill_depth_mm = 19), 
                            interval = "confidence", level = 0.99)
q1.e <- c(conf_interval_19[2], conf_interval_19[3])

# What is the p-value for determining if there is evidence that
#  the slope of this model is different from 0?
q1.f <- summary(model1)$coefficients[2, 4]

# Does this model indicate that for increased bill depth we expect
#  an increase or decrease in average bill length?
inc.dec.options=c("Increase", "Decrease")
# Since the slope is positive, increased bill depth leads to increased bill length
q1.g <- inc.dec.options[1]

# Question 2
# Fit a model to predict bill length from bill depth with
# different intercepts (but not slopes) based on sex for
#  the palmerpenguins data

# Model with different intercepts by sex: bill_length ~ bill_depth + sex
model2 <- lm(bill_length_mm ~ bill_depth_mm + sex, data = penguins)

# What is the estimated intercept term for female penguins?
# Female is the reference level, so it's just the intercept
q2.a <- model2$coefficients[[1]]

# What is the estimated intercept term for male penguins?
# Male intercept = base intercept + male coefficient
q2.b <- model2$coefficients[[1]] + model2$coefficients[[3]]

# What is the expected bill length for a male
#  penguin with a bill depth of 14mm?
q2.c <- predict(model2, newdata = data.frame(bill_depth_mm = 14, sex = "male"))[[1]]

# Construct a 95% prediction interval for the 
#  bill length of a female penguin with a bill depth of 19mm
pred_interval_f19 <- predict(model2, newdata = data.frame(bill_depth_mm = 19, sex = "female"), 
                             interval = "prediction", level = 0.95)
q2.d <- c(pred_interval_f19[2], pred_interval_f19[3])

# Construct a 95% confidence interval for the 
#  slope of the regression equation
slope_se <- summary(model2)$coefficients[2, 2]
slope_est <- model2$coefficients[[2]]
df_resid <- summary(model2)$df[2]
t_val <- qt(0.975, df_resid)
q2.e <- c(slope_est - t_val * slope_se, slope_est + t_val * slope_se)

# TRUE or FALSE: Using the p-values to determine parameter significance, 
#  we should keep the sex differentiated intercept in this model.
sex_pvalue <- summary(model2)$coefficients[3, 4]
q2.f <- sex_pvalue < 0.05

# Does this model indicate that for increased bill depth we expect
#  an increase or decrease in average bill length?
inc.dec.options=c("Increase", "Decrease")
q2.g <- inc.dec.options[1]  # Slope is still positive

# Question 3
# Fit a model to predict bill length from bill depth with
# different intercepts and slopes based on sex for
#  the palmerpenguins data

# Model with interaction: bill_length ~ bill_depth * sex
model3 <- lm(bill_length_mm ~ bill_depth_mm * sex, data = penguins)

# What is the estimated slope term for female penguins?
# Female is reference, so it's the bill_depth coefficient
q3.a <- model3$coefficients[[2]]

# What is the estimated slope term for male penguins?
# Male slope = base slope + interaction coefficient
q3.b <- model3$coefficients[[2]] + model3$coefficients[[4]]

# Construct a 90% prediction interval for the 
#  bill length of a male penguin with a bill depth of 15mm
pred_interval_m15 <- predict(model3, newdata = data.frame(bill_depth_mm = 15, sex = "male"), 
                             interval = "prediction", level = 0.90)
q3.c <- c(pred_interval_m15[2], pred_interval_m15[3])

# Construct a 99% confidence interval for the average
#  bill length of a female penguin with a bill depth of 18mm
conf_interval_f18 <- predict(model3, newdata = data.frame(bill_depth_mm = 18, sex = "female"), 
                             interval = "confidence", level = 0.99)
q3.d <- c(conf_interval_f18[2], conf_interval_f18[3])

# What is the p-value for determining the signficance of the 
#  difference in slope for male penguins?
q3.e <- summary(model3)$coefficients[4, 4]

# TRUE or FALSE: Using the p-values to determine parameter significance, 
#  we should keep the sex differentiated intercept and slope in this model.
sex_main_pvalue <- summary(model3)$coefficients[3, 4]
interaction_pvalue <- summary(model3)$coefficients[4, 4]
q3.f <- (sex_main_pvalue < 0.05) | (interaction_pvalue < 0.05)

# Does this model indicate that for increased bill depth we expect
#  an increase or decrease in average bill length?
inc.dec.options=c("Increase", "Decrease")
q3.g <- inc.dec.options[1]  # Both slopes are positive

# Question 4
# Fit a model to predict bill length from bill depth with
# different intercepts and slopes based on species for
#  the palmerpenguins data

# Model with species interaction: bill_length ~ bill_depth * species
model4 <- lm(bill_length_mm ~ bill_depth_mm * species, data = penguins)

# What is the estimated intercept term for Adelie penguins?
# Adelie is the reference level
q4.a <- model4$coefficients[[1]]

# What is the estimated intercept term for Gentoo penguins?
# Gentoo intercept = base intercept + Gentoo coefficient
q4.b <- model4$coefficients[[1]] + model4$coefficients[[3]]

# What is the estimated slope term for Adelie penguins?
# Adelie is reference, so it's the bill_depth coefficient
q4.c <- model4$coefficients[[2]]

# What is the estimated slope term for Chinstrap penguins?
# Chinstrap slope = base slope + Chinstrap interaction coefficient
q4.d <- model4$coefficients[[2]] + model4$coefficients[[5]]

# What is the expected bill length for a Gentoo
#  penguin with a bill depth of 15mm?
q4.e <- predict(model4, newdata = data.frame(bill_depth_mm = 15, species = "Gentoo"))[[1]]

# Construct a 80% prediction interval for the 
#  bill length of a Chinstrap penguin with a bill depth of 20mm.
pred_interval_c20 <- predict(model4, newdata = data.frame(bill_depth_mm = 20, species = "Chinstrap"), 
                             interval = "prediction", level = 0.80)
q4.f <- c(pred_interval_c20[2], pred_interval_c20[3])

# Construct a 90% confidence interval for the average
#  bill length of an Adelie penguin with a bill depth of 17mm
conf_interval_a17 <- predict(model4, newdata = data.frame(bill_depth_mm = 17, species = "Adelie"), 
                             interval = "confidence", level = 0.90)
q4.g <- c(conf_interval_a17[2], conf_interval_a17[3])

# Does this model indicate that for increased bill depth we expect
#  an increase or decrease in average bill length?
inc.dec.options=c("Increase", "Decrease")
q4.h <- inc.dec.options[1]  # All slopes are positive

# The following plotting function might help with understanding the
#  following analysis.
# NOTE: YOU MUST RECOMMENT THIS BLOCK BEFORE SUBMITTING
#  TO GRADESCOPE. GENERATING PLOTS IN SUBMITTED CODE
#  WILL FAIL THE AUTOGRADER.
# UNCOMMENT below to show, RECOMMENT before submitting
# makeplot() 

#Question 5
# Which model do you think best describes the data?
# Model 4 (species-based) likely fits best as species accounts for 
# more biological variation than sex alone
q5.answers=c("Model 1", "Model 2", "Model 3", "Model 4")
q5.a <- q5.answers[4]