#Day-4 2nd 

#program 1.(i)

letters_sample<- sample(LETTERS, 5)
letters_factor<- factor(letters_sample)
levels(letters_factor)

#1.(ii)
find_range<- function(x){
  range <- max(x) - min(x)
  return(range)
}
C <- c(9,8,7,6,5,4,3,2,1)
find_range(C)

#1.(iii)
find_vowels<- function(str){
  vowels <- c("a", "e", "i", "o", "u", "A", "E", "I", "O", "U")
  count <- sum(str %in% vowels)
  return(count)
}

c <- "matrix"
find_vowels(c)

#program 2.(i)

data("ChickWeight")
str(ChickWeight)
nrow(ChickWeight)

#2.(ii)
tail(ChickWeight, 6)

#2.(iii)
ChickWeight_order<- arrange(ChickWeight, weight)
ChickWeight_grouped<- group_by(ChickWeight_order, Diet)
ChickWeight_grouped_summarized<- summarize(ChickWeight_grouped, mean_weight = mean(weight))

#2.(iv)
library(reshape2)
ChickWeight_melt<- melt(ChickWeight, id.vars = c("Chick", "Time", "Diet"))


#2.(v)

ChickWeight_cast<- dcast(ChickWeight_melt, Diet ~ variable, mean)

#3.(i)
summary(ChickWeight)

#3.(ii)
library(ggplot2)
ggplot(ChickWeight, aes(x=Diet, y=weight)) + 
  geom_boxplot()

#3.(iii)
ggplot(ChickWeight[ChickWeight$Diet==1,], aes(x=weight)) + 
  geom_histogram(binwidth=2)

#3.(iv)
ggplot(ChickWeight[ChickWeight$Diet==4,], aes(x=weight)) + 
  geom_histogram(binwidth=2)

#3.(v)
ggplot(ChickWeight, aes(x=Time, y=weight, color=Diet)) + 
  geom_point() + 
  geom_smooth(method=lm)

  
#program 4

#4.(i)
model <- lm(weight ~ Time + Diet, data=ChickWeight)

#4.(ii)

new_data<- data.frame(Time=10, Diet=1)
new_data$Diet<- as.factor(new_data$Diet)
predicted_weight<- predict(model, newdata=new_data)

#4.(iii)
actual_weight<- 10 # (or any other value for actual weight)
error <- predicted_weight - actual_weight
mean(error^2)
