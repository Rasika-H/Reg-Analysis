
library(faraway)
library(olsrr)

p3 <- read.csv(file= "bee_keepingdata/US_honey_dataset_updated.csv",header = TRUE)
head(p3)

model <- lm(average_price ~ colonies_number + yield_per_colony + production + stocks + value_of_production + year, data = p3) 
anova(model)

model1 <- lm(average_price ~ colonies_number + yield_per_colony + year, data = p3)
k <- ols_step_all_possible(model1)

 
ols_step_best_subset(model)

k <- ols_step_forward_p(model, details=TRUE)
plot(k)

ols_step_backward_p(model, details=TRUE)
plot(k)

k <- ols_step_both_p(model, details=TRUE) 
plot(k)
