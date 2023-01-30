#program 1 (i) 

kelvin_to_celsius <- function(temp_in_kelvin){
  temp_in_celsius <- temp_in_kelvin - 273.15
  return(temp_in_celsius)
}
result <- kelvin_to_celsius(300)
print(result)



#1(ii)
 x <- c(90, 50, 70, 80, 70, 60, 20, 30, 80, 90, 20)
mean(x)
median(x)
table(x)

#1(iii)
 x <- c(90, 50, 70, 80, 70, 60, 20, 30, 80, 90, 20)
sort(x)[2] # 2nd highest value
sort(x)[length(x)-2] # 3rd lowest value


#program 2(i)

airquality <- airquality

sum_temp <- 0
n <- nrow(airquality)
for(i in 1:n){
  sum_temp <- sum_temp + airquality[i, "Temp"]
}
mean_temp <- sum_temp / n
print(mean_temp)


#2(ii)
 first_five_rows <- airquality[1:5, ]
print(first_five_rows)


#2(iii)
 columns_to_remove <- c("Temp", "Wind")
new_airquality <- airquality[, !(names(airquality) %in% columns_to_remove)]
print(new_airquality)


#2(iv)
min_temp <- min(airquality$Temp)
coldest_day <- airquality[airquality$Temp == min_temp, ]
print(coldest_day)


#2(v)
windy_days <- airquality[airquality$Wind > 17, ]
count_windy_days <- nrow(windy_days)
print(count_windy_days)


#program 3.(i)

airquality <- airquality
summary(airquality)

#3(ii)
airquality_melt <- melt(airquality, id.vars = c("Month", "Day"))
print(airquality_melt)

#3(iii)
airquality_melt <- melt(airquality, id.vars = c("Month", "Day"))
print(airquality_melt)

#3(iv)
airquality_cast <- dcast(airquality_melt, Month + Day ~ variable)
print(airquality_cast)


#3(v)
airquality_cast <- dcast(airquality_melt, Month + Day ~ variable)
print(airquality_cast)

#program 4.(i)

airquality <- airquality
na_count <- sum(is.na(airquality))
if (na_count / nrow(airquality) < 0.1) {
  airquality <- na.omit(airquality)
} else {
  for (col in colnames(airquality)) {
    airquality[is.na(airquality[col]), col] <- mean(airquality[col], na.rm = T)
  }
}

#4(ii) 
model <- lm(Ozone ~ Solar.R, data = airquality)
summary(model)


(iii)library(ggplot2)
ggplot(airquality, aes(x = Solar.R, y = Ozone)) + 
  geom_point() + 
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) + 
  ggtitle("Scatter Plot of Ozone vs Solar.R with Regression Line")

