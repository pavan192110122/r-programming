#program 1(i)

fibonacci <- function(n) {
  if (n <= 2) {
    return(1)
  } else {
    return(fibonacci(n-1) + fibonacci(n-2))
  }
}


#program 1.(ii)

for (i in 1:20) {
  print(fibonacci(i))
}
sum <- 0
for (i in 1:30) {
  sum <- sum + i
}


#program 1.(iii)

vec <- 1:10
squared_vec <- vec^2
print(squared_vec)


#program 2(i) dimension

dim(mtcars)


#program 2.(ii)summary

sum(mtcars)

#program.2(iii)  factor function

str(mtcars)

#program 2.(iv)

aggregate(wt ~ vs, data=mtcars, mean)

#program 2.(v)
 smallest and largest

library(dplyr)
mtcars %>% 
  group_by(vs) %>% 
  summarise(min_wt = min(wt), max_wt = max(wt))


#program 3(i)

library(ggplot2)
ggplot(mtcars, aes(x=wt, y=disp, color=factor(vs))) + 
  geom_point() + 
  ggtitle("Weight vs Displacement Scatter Plot by Engine Shape") + 
  xlab("Weight (wt)") + 
  ylab("Displacement (disp)") + 
  scale_color_discrete(name="Engine Shape (vs)")

#program 3.(ii)

library(ggplot2)
ggplot(mtcars, aes(x=hp, y=mpg, color=factor(vs))) + 
  geom_point() + 
  ggtitle("Horsepower vs Mileage Scatter Plot by Engine Shape") + 
  xlab("Horsepower (hp)") + 
  ylab("Mileage (mpg)") + 
  scale_color_discrete(name="Engine Shape (vs)")

#program 3(iii)

library(ggplot2)
ggplot(mtcars, aes(x=hp, fill=factor(cyl))) + 
  geom_histogram(binwidth=5) + 
  ggtitle("Horsepower Histogram by Cylinder Size") + 
  xlab("Horsepower (hp)") + 
  ylab("Frequency") + 
  scale_fill_discrete(name="Cylinder Size (cyl)")

 
#program 4(i)

library(ggplot2)
library(dplyr)
library(caret)
data(mtcars)
ggplot(mtcars, aes(x = wt, y = vs)) +
  geom_point(aes(color = as.factor(vs))) +
  ggtitle("Engine Shape vs. Weight")
features <- c("wt", "hp", "qsec")
set.seed(123)
index <- createDataPartition(mtcars$vs, p = 0.8, list = FALSE)
train_data <- mtcars[index, c(features, "vs")]
test_data <- mtcars[-index, c(features, "vs")]
model <- train(vs ~ ., data = train_data, method = "glm", family = binomial("logit"))
predictions <- predict(model, newdata = test_data)
confusionMatrix(predictions, test_data$vs)


#program 4.(ii)

library(caret)
data(mtcars)
set.seed(123)
index <- createDataPartition(mtcars$vs, p = 0.8, list = FALSE)
train_data <- mtcars[index, ]
test_data <- mtcars[-index, ]
model <- glm(vs ~ ., data = train_data, family = binomial("logit"))
predictions <- predict(model, newdata = test_data, type = "response")
predictions <- ifelse(predictions > 0.5, 1, 0)

#program 4(iii)

library(caret)
data(mtcars)
set.seed(123)
index <- createDataPartition(mtcars$vs, p = 0.8, list = FALSE)
train_data <- mtcars[index, ]
test_data <- mtcars[-index, ]
model <- glm(vs ~ ., data = train_data, family = binomial("logit"))
predictions <- predict(model, newdata = test_data, type = "response")
predictions <- ifelse(predictions > 0.5, 1, 0)
confusionMatrix(predictions, test_data$vs)
Footer