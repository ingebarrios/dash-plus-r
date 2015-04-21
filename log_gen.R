arc$DAY = strptime(arc$DAY, format="%m-%d-%y %H:%M")
arc$weekday <- weekdays(as.Date(arc$DAY))
arc$Hour = arc$DAY$hour
weekdayCounts = as.data.frame(table(arc$weekday))
weekdayCounts$Var1 = factor(weekdayCounts$Var1, ordered=TRUE, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday","Saturday"))
library(ggplot2)
DayHourCounts = as.data.frame(table(arc$weekday, arc$Hour))
weekdayCounts$Var1 = factor(weekdayCounts$Var1, ordered=TRUE, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday","Saturday"))
DayHourCounts = as.data.frame(table(arc$weekday, arc$Hour))
DayHourCounts$Hour = as.numeric(as.character(DayHourCounts$Var2))
DayHourCounts$Type = ifelse((DayHourCounts$Var1 == "Sunday") | (DayHourCounts$Var1 == "Saturday"), "Weekend", "Weekday")
DayHourCounts$Var1 = factor(DayHourCounts$Var1, ordered=TRUE, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
ggplot(DayHourCounts, aes(x = Hour, y = Var1)) + geom_tile(aes(fill = Freq)) + scale_fill_gradient(name="Total archive generation", low="white", high="red") + theme(axis.title.y = element_blank())


