# carData에 있는 TitanicSurvival 데이터를 이용 ,
# 나이 결측값을 제거하고 1046개의 데이터로 
# 선실별 사망자와 생존자 수를 하나의 bar graph에 겹쳐서 나타내기  
library(carData)
TitanicSurvival
str(TitanicSurvival)
data.na <- TitanicSurvival[complete.cases(TitanicSurvival),] # 결측값 있는 행 제거 
str(data.na)
#survived <-TitanicSurvival$survived
#passengerClass <- TitanicSurvival$passengerClass
#tbl <- table(survived,passengerClass)
tbl <- table(TitanicSurvival$survived,TitanicSurvival$passengerClass)
tbl
tbl <- as.matrix(tbl)
barplot(tbl, 
        main = '선실별 사망자, 생존자 수',
        col = rainbow(2),
        names=c('First','Second','Third'),
        legend.text = c('사망자','생존자'),
        args.legend = list(x='topleft',inset=c(0.1,0))
        )


