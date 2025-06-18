
library(readr)

walmart <- read_csv("C:/Users/ASSA/Desktop/PROJET/Walmart.csv")
view (walmart)

dim(walmart) 

mean(walmart $store)
median(walmart$store) 
min(walmart$store) 
max(walmart$store) 
quantile(walmart$store)
var(walmart$Store) 
sd(walmart$Store) 

library(e1071)
linearMod <- lm(Walmart$Weekly_Sales ~ Walmart$CPI, data=Walmart) 
print(linearMod)


scatter.smooth(x=walmart $Temperature, Y=walmart $weekly_Sales, main="Temperature-weekly_Sales")


#density plot pour weekly_Sales

par (mfrow=c(1, 2)) # divide graph area in 2 columns
plot (density (walmart $weekly_Sales), main="Density Plot: weekly_Sales", ylab="Frequency", sub-paste("skewness:",
                                                                                                      round (e1071: skewness (walmart $weekly_sales), 2)))
polygon (density (walmart $weekly_sales), col="red")
#density plot pour CPI

plot (density (walmart$CPI), main="Density Plot: CPI", ylab="Frequency", sub-paste ("Skewness:",
                                                                                    round (e1071: skewness (walmart$CPI), 2)))
polygon (density (walmart$CPI), col="blue")


#boxplot for weekly_sales
par (mfrow=c(1, 2))
boxplot (walmart $weekly_sales, main="weekly_sales", sub-paste("outlier rows:",
                                                               boxplot.stats (walmart $weekly_Sales) $out))
#boxplot for CPI
boxplot (walmart$CPI, main="CPI", sub=paste("Outlier rows: ",
                                            boxplot.stats (walmart $CPI) $out))

cor (walmart$store, walmart $weekly_Sales)

library(ggplot2)
income.graph<-ggplot(Walmart, aes(x=Walmart$CPI, y=Walmart$Weekly_Sales))+geom_point()
income.graph

income.graph <- income.graph + geom_smooth(method="lm", col="red")
income.graph
                                                                                    